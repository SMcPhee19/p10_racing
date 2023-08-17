# frozen_string_literal: true

class Season < ApplicationRecord
  validates_uniqueness_of :season_year

  has_many :user_seasons, dependent: :destroy
  has_many :users, through: :user_seasons

  def next_race_weekend
    schedule = F1Facade.new.get_schedule(season_year)
    race_array = schedule[:MRData][:RaceTable][:Races]
    race_array.select { |race| Date.parse(race[:date]) > Date.today }.first
  end

  def last_race_weekend
    result = F1Facade.new.get_latest_race
    result[:MRData][:RaceTable][:Races][0]
  end
end
