# spec/support/helpers/authentication_helper.rb

module AuthenticationHelper
  def log_in_user(user)
    session[:username] = user.username
  end

  def log_out_user
    session.delete(:username)
  end
end
