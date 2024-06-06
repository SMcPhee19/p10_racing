# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    @hide_header = true
  end

  def create # rubocop:disable Metrics/MethodLength
    @hide_header = true
    @user = User.find_by(username: params[:username])
    @service = JwtService.new
    
    #TODO: Handling here for username not found/@user==null

    pw_result = @user.validate_user_password(params[:password])
    if pw_result == 1
      # User is now authenticated
      session[:username] = @user.username
      session[:token] = @service.create_token(user: @user)
      # If there's a redirect specified, send there. Otherwise go to home page.
      if session[:redirect_url].present?
        render :inline => 'window.location=\'' + session[:redirect_url] +'\''
      else
        render :inline => 'window.location=\'/dashboard\''
      end
    elsif pw_result == 2
      # Return generic error message and route nowhere
      flash.now[:error] = 'Password is expired!'
      flash.now[:username] = params[:username]
      redirect_to new_password_reset_path #TODO: Add a controller for this route
    else
      # Return generic error message and route nowhere
      flash.now[:error] = 'Invalid email or password'
      flash.now[:username] = params[:username]
      render :new
    end
  end

def destroy
    session.delete :username
    session.delete :token
    redirect_to '/sessions/new', notice: 'Redirecting to login page'
  end

  def guest_login
    @hide_header = true
    @user = User.find_by(username: 'guest')
    @service = JwtService.new

    session[:username] = 'guest'
    session[:token] = @service.create_token(user: @user)
    
    render :inline => 'window.location=\'/dashboard\''
  end
end