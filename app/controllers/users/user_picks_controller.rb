# frozen_string_literal: true

module Users
  class UserPicksController < ApplicationController
    def index
      require 'pry'; binding.pry
      @user = User.find_by(username: params[:username])
      require 'pry'; binding.pry
      @season = Season.find(params[:season_id])
      @races = F1Facade.new.get_schedule(@season.season_year)
      @user_picks = @user.user_picks.where(season_id: @season.id).order(created_at: :asc)
      @position = 1
    end
  end
end 
