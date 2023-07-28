class LeaderboardController < ApplicationController
  def index
    @users = User.order(total_points: :desc)
    @position = 1
    @drivers = F1Facade.new.get_drivers(@users.first.seasons.last.season_year)
  end
end