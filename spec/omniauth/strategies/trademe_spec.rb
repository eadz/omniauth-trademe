require 'spec_helper'

describe OmniAuth::Strategies::Trademe do
  subject do
    OmniAuth::Strategies::Trademe.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("trademe")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://secure.trademe.co.nz')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_path.should eq('/Oauth/Authorize')
    end
  end
end