require 'spec_helper'

describe SessionsController do
  describe "Authentication with Twitter" do
    describe "for a new user" do
      before do
        request.env['omniauth.auth'] = { 
          'provider' => 'twitter', 
          'uid' => '1234', 
          'user_info' => { 'name' => 'Joe User', 'email' => 'joe@example.com'}
        }

        get :create, :provider => 'twitter'
        @user = User.where(:name => 'Joe User').first
      end

      it { @user.should_not be_nil }
      it { @user.auth_provider.should eql 'twitter' }
      it { @user.auth_uid.should eql '1234' }
      it { @user.name.should eql 'Joe User' }
    end

    describe "for an existing user" do
      before do
        request.env['omniauth.auth'] = { 
          'provider' => 'twitter', 
          'uid' => '1234', 
          'user_info' => { 'name' => 'Joe User', 'email' => 'joe@example.com'}
        }

        User.create!(:auth_provider => 'twitter', :auth_uid => '1234', :name => 'Joe User')
        User.expects(:create_with_twitter_auth).never

        get :create, :provider => 'twitter'
      end

      it { response.should redirect_to root_url }
    end
  end

  describe 'Sign out' do
    it 'should clear the session user id' do
      login

      # Check sanity
      session[:user_id].should_not be_nil
      controller.send(:current_user).should be_a User

      delete :destroy

      session[:user_id].should be_nil
      controller.send(:current_user).should be_nil
    end
  end
end
