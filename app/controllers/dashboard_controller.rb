# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @hide_header = true
    if params.include?('season_id')
      redirect_to season_path(params[:season_id])
    else
      @seasons = Season.all
    end
  end
end
