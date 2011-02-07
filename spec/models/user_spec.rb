require 'spec_helper'

describe User do
  describe "creating with auth data" do
    it 'should create a new record from Omniauth auth data' do
      auth = {
        'provider' => 'twitter',
        'uid' => '1234',
        'user_info' => { 'name' => 'Joe User' }
      }

      user = User.create_with_auth(auth)

      user.name.should eql auth['user_info']['name']
      user.auth_provider.should eql auth['provider']
      user.auth_uid.should eql auth['uid']
    end
  end

  describe 'favourites' do
    before do
      @user = Factory(:user)
      @link = Factory(:link)
      @other_link = Factory(:link)

      @user.favourites.create!(:link => @link)
    end

    it { @user.favourites.ids.should include(@link.id) }
    it { @user.favourite?(@link).should be_true }

    it { @user.favourites.ids.should_not include(@other_link.id) }
    it { @user.favourite?(@other_link).should be_false }
  end
end
