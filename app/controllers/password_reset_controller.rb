class PasswordResetController < ApplicationController
  
  skip_before_action :authorize

  # Change pw/Confirm new pw form
  def create

  end

  # Lookup a user
  def new
    @hide_header = true

    user_name = params[:username]

    @user = User.find_by(username: user_name)

    if @user == nil
      flash.now[:error] = "Invalid username '#{user_name}'"
      render :edit
      return
    end

    old_password = params[:old_password]
    new_password = params[:new_password]
    confirm_password = params[:confirm_password]

    pw_result = @user.validate_user_password(old_password)

    # Make sure the old password is actually correct
    if pw_result == 0
      flash.now[:error] = 'Old password is invalid'
      render :edit
      return
    end

    # Ensure new password is actually different
    if old_password == new_password
      flash.now[:error] = 'New password cannot be the same as old password'
      render :edit
      return
    end

    # Ensure new passowrd and confirm password match
    if new_password != confirm_password
      flash.now[:error] = 'New password and confirm password do not match'
      render :edit
      return
    end

    new_pw_result = @user.validate_user_password_requirements(new_password)

    if new_pw_result != []
      flash.now[:error] = new_pw_result
      render :edit
      return
    end

    success = @user.update_user_password(new_password)
    if !success
      flash.now[:error] = 'Failed to reset user password'
      render :edit
      return
    else
      # Return user to login form
      redirect_to '/sessions/new'
    end
  end

  # Change the pw
  def edit
    @hide_header = true

    require 'pry'; binding.pry
  end

  def force_reset
    user_name = params[:username]

    @user = User.find_by(username: user_name)
    @default_password = 'Elephant-208_'

    if @user.update_user_password(@default_password)
      @user.update(pw_expire: 1.day.ago) # Force expiration to the prior day
      redirect_to admin_path, notice: 'User password reset successfully.'
    else
      redirect_to admin_path, alert: 'Failed to reset user password'
    end
    # TODO: Make @default_password an ENV to called in this method. 
  end
end