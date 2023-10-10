# frozen_string_literal: true

module Users
  class UserPicksController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @season = Season.find(params[:season_id])
      @races = F1Facade.new.get_schedule(@user.seasons.last.season_year)
      @user_picks = @user.user_picks.where(season_id: @season.id).order(created_at: :asc)
      @position = 1
    end
  end
end
