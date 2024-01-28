# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    @hide_header = true
  end

  def create
    @hide_header = true
    @user = User.find_by(username: params[:username])
    if @user.validate_user_password(params[:password])
      # User is now authenticated
      session[:username] = @user.username
      # If there's a redirect specified, send there. Otherwise go to home page.
      if params[:redirect_url].present?
        require 'pry'
        binding.pry
        redirect_to params[:redirect_url], notice: 'redirecting to #params[:redirect_url]'
      else
        redirect_to '/', notice: 'Successfully returned to root path'
      end
    else
      # Return generic error message and route nowhere
      flash.now[:error] = 'Invalid email or password'
      flash.now[:username] = params[:username]
      render :new
    end
  end

  def destroy
    session.delete :username
    redirect_to '/sessions/new', notice: 'Redirecting to login page'
  end

  # def guest_login
  #   Implement guest login logic
  #   For example, you can create a temporary guest user
  #   and log them in automatically
  #   redirect_to appropriate path
  # end
end
