# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index
    @season = Season.find(params[:season_id])
    @user_seasons = UserSeason.where(season_id: params[:season_id]).order(total_points: :desc)
    @position = 1
    @drivers = F1Facade.new.get_drivers(@user_seasons.last.season.season_year)
  end
end
