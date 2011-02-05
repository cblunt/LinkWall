class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.where(:auth_provider => auth['provider'], :auth_uid => auth['uid']).first || User.create_with_twitter_auth(auth)
    session[:user_id] = user.id

    redirect_to root_url, :notice => 'Signed in'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed out'
  end
end
