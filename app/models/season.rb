# frozen_string_literal: true

class Season < ApplicationRecord
  validates_uniqueness_of :season_year

  has_many :user_seasons
  has_many :users, through: :user_seasons

  def next_race_weekend
    # schedule = F1Facade.new.get_schedule(season_year)
    # next_race = schedule.where('date > ?', Date.today).first
    schedule = F1Facade.new.get_schedule(season_year)
    race_array = schedule[:MRData][:RaceTable][:Races]
    next_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first
  end

  def last_race_weekend
    result = F1Facade.new.get_latest_race
    finish_array = result[:MRData][:RaceTable][:Races][0]
  end
end
