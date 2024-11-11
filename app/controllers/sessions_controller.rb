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
    
    # If no user found, return an error message and stop further processing
    if @user == nil
      # Return generic error message and route nowhere
      flash.now[:error] = 'Invalid username or password'
      flash.now[:username] = params[:username]
      render :new
      return
    end

    pw_result = @user.validate_user_password(params[:password])
    if pw_result == 1
      # User is now authenticated
      session[:username] = @user.username
      session[:token] = @service.create_token(user: @user)
      # If there's a redirect specified, send there. Otherwise go to home page.
      if session[:redirect_url].present?
        redirect_to session[:redirect_url]
      else
        redirect_to 'dashboard'
      end
    elsif pw_result == 2
      # Return generic error message and route nowhere
      flash.now[:error] = 'Password is expired!'
      flash.now[:username] = params[:username]
      render '/password_reset/edit', locals: {:id => @user.id}
    else
      # Return generic error message and route nowhere
      flash.now[:error] = 'Invalid username or password'
      flash.now[:username] = params[:username]
      render :new
    end
  end

def forgot_password
  @hide_header = true  
end

def reset_password
  @hide_header = true
  @user = User.find_by(username: params[:username])
  
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
    
    redirect_to 'dashboard'
  end
end