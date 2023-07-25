# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @seasons = Season.all
  end
end
