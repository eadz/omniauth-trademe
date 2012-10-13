require 'omniauth-oauth'

module OmniAuth
  module Strategies

    class Trademe < OmniAuth::Strategies::OAuth
      
      option :name, 'trademe'
      
      option :client_options, {
        :site => 'https://secure.trademe.co.nz',
        :request_token_path  => "/Oauth/RequestToken",
        :access_token_path   => "/Oauth/AccessToken",
        :authorize_path      => "/Oauth/Authorize"
      }
      
      uid { 
        user_info['id']
      }
      
      info do 
        {
          :nickname => user_info['username'],
          :email => user_info['email'],
          :name => user_info['fullname'],
          :first_name => user_info['firstname'],
          :last_name => user_info['lastname'],
          :description => user_info['about'],
          :image => user_info['userpic_url'],
          :urls => {
            '500px' => user_info['domain'],
            'Website' => user_info['contacts']['website']
          }
        }
      end
      
      extra do
        {
          :raw_info => raw_info
        }
      end

      # Return info gathered from the flickr.people.getInfo API call 
     
      def raw_info
        @raw_info ||= JSON.decode(access_token.get('/v1/users.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      # Provide the "Person" portion of the raw_info
      
      def user_info
        @user_info ||= raw_info.nil? ? {} : raw_info["user"]
      end
      
      def request_phase
        options[:authorize_params] = {:perms => options[:scope]} if options[:scope]
        super
      end
    end
  end
end