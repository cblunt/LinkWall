def login(user = nil)
  user ||= Factory(:user)
  session[:user_id] = user.id

  user
end
