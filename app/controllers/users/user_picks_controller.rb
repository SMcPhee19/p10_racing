class Users::UserPicksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @races = F1Facade.new.get_schedule(@user.seasons.last.season_year)
  end
end