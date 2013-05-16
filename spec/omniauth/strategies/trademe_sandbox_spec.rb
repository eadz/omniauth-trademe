require 'spec_helper'

describe OmniAuth::Strategies::TrademeSandbox do
  subject do
    OmniAuth::Strategies::TrademeSandbox.new({})
  end

  context 'client options' do
    it 'should have correct name' do
      subject.options.name.should eq("trademe_sandbox")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://api.tmsandbox.co.nz')
    end

    it 'should have correct request token url' do
      subject.options.client_options.request_token_path.should eq('https://secure.tmsandbox.co.nz/Oauth/RequestToken')
    end

    it 'should have correct access token url' do
      subject.options.client_options.access_token_path.should eq('https://secure.tmsandbox.co.nz/Oauth/AccessToken')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_path.should eq('https://secure.tmsandbox.co.nz/Oauth/Authorize')
    end
  end
end