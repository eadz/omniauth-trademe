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
        raw_info['MemberId']
      }
      
      info do 
        {
          :nickname => raw_info['Nickname'],
          :email => raw_info['Email'],
          :first_name => raw_info['FirstName'],
          :last_name => raw_info['LastName'],
          :name => [raw_info['FirstName'],raw_info['LastName']].join(' ')
        }
      end
      
      extra do
        {
          :raw_info => raw_info
        }
      end

      # Return info gathered from the trademe API call 
     
      def raw_info
        @raw_info ||= MultiJson.decode(access_token.get('https://api.trademe.co.nz/v1/MyTradeMe/Summary.json').body)
      rescue ::Errno::ETIMEDOUT
        raise ::Timeout::Error
      end

      def user_info
        raw_info
      end

      def request_phase
        options[:authorize_params] = {:perms => options[:scope]} if options[:scope]
        super
      end
    end
  end
end