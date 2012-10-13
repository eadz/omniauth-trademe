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
        user_info['MemberId']
      }
      
      info do 
        {
          :nickname => user_info['Nickname'],
          :email => user_info['Email'],
          :first_name => user_info['FirstName'],
          :last_name => user_info['LastName']
        }
      end
      
      extra do
        {
          :raw_info => raw_info
        }
      end

      # Return info gathered from the trademe API call 
     
      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('https://api.tmsandbox.co.nz/v1/MyTradeMe/Summary.json').body)
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