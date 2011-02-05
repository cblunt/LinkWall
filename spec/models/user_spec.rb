require 'spec_helper'

describe User do
  describe "creating from Twitter auth" do
    it 'should create a new record from Twitter auth data' do
      auth = {
        'provider' => 'twitter',
        'uid' => '1234',
        'user_info' => { 'name' => 'Joe User' }
      }

      user = User.create_with_twitter_auth(auth)

      user.name.should eql auth['user_info']['name']
      user.auth_provider.should eql auth['provider']
      user.auth_uid.should eql auth['uid']
    end
  end
end
