# frozen_string_literal: true

class Season < ApplicationRecord
  validates_uniqueness_of :season_year
  validates :season_year, presence: true

  has_many :user_seasons, dependent: :destroy
  has_many :users, through: :user_seasons

  # def next_race_weekend
  #   schedule = F1Facade.new.get_schedule(season_year)
  #   race_array = schedule[:MRData][:RaceTable][:Races]
  #   race_array.select { |race| Date.parse(race[:date]) >= Date.today }.first
  # end

  def next_race_weekend(season)
    mt_timezone = 'Mountain Time (US & Canada)'
    mt_time_now = Time.now.in_time_zone(mt_timezone).to_date

    schedule = F1Facade.new.get_schedule(season_year)
    race_array = schedule[:MRData][:RaceTable][:Races]
    if season.to_i < mt_time_now.year
      'This season is over. Please select a different season.'
    else
      race_array.select { |race| Date.parse(race[:date]) >= mt_time_now }.first
    end
  end

  def last_race_weekend
    result = F1Facade.new.get_latest_race
    result[:MRData][:RaceTable][:Races][0]
  end
end
