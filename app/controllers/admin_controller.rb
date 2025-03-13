class AdminController < ApplicationController
  def show
    # require 'pry'; binding.pry
    @season = Season.find(params[:season_id])
    @users = User.all
  end
end