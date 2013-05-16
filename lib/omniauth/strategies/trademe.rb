require 'omniauth-oauth'

module OmniAuth
  module Strategies

    class Trademe < OmniAuth::Strategies::OAuth

      option :name, 'trademe'

      option :client_options, {
        :site => 'https://api.trademe.co.nz',
        :request_token_path  => "https://secure.trademe.co.nz/Oauth/RequestToken",
        :access_token_path   => "https://secure.trademe.co.nz/Oauth/AccessToken",
        :authorize_path      => "https://secure.trademe.co.nz/Oauth/Authorize"
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
        @raw_info ||= MultiJson.decode(access_token.get('/v1/MyTradeMe/Summary.json').body)
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

    class TrademeSandbox < Trademe
      option :name, 'trademe_sandbox'

      default_options[:client_options][:site] = 'https://api.tmsandbox.co.nz'
      default_options[:client_options][:request_token_path] = 'https://secure.tmsandbox.co.nz/Oauth/RequestToken'
      default_options[:client_options][:access_token_path] = 'https://secure.tmsandbox.co.nz/Oauth/AccessToken'
      default_options[:client_options][:authorize_path] = 'https://secure.tmsandbox.co.nz/Oauth/Authorize'
    end
  end
end