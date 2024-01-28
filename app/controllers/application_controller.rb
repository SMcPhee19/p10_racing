# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ActionController::Cookies

  before_action :authorize

  private

  def authorize
    current_user = User.find_by(username: session[:username])
    session[:redirect_url] = request.original_url
    return if current_user

    redirect_to '/sessions/new', notice: 'Redirecting to login'
  end
end
