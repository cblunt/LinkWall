require 'spec_helper'

describe SessionsController do
  describe "GET 'create' from Twitter" do
    controller.stubs(:auth_hash).returns({:provider => 'twitter', :uid => '1234'})
    get :create

    assigns(:user).should_not be_nil
  end
end

def stub_env_for_twitter_auth
  env = { 'omniauth.auth' => { 'provider' => 'twitter', 'uid' => '1234', 'extra' => { 'user_hash' => { 'email' => 'user@example.com' }}}}
  @controller.stubs(:env).returns(env)
end
