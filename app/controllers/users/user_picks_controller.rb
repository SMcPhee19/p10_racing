class Users::UserPicksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    # require 'pry'; binding.pry
    @races = F1Facade.new.get_schedule(@user.seasons.last.season_year)
  end
end