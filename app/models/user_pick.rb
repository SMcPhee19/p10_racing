# frozen_string_literal: true

class UserPick < ApplicationRecord
  belongs_to :user
  has_many :seasons, through: :user_seasons

  validates_presence_of :user_id, :circuit_id

  validate :driver_ids

  validates :circuit_id, uniqueness: { scope: :user_id, message: 'You can only make one user pick per weekend' }

  def driver_ids
    return unless driver_id_tenth == driver_id_dnf

    errors.add(:driver_id_tenth, "can't be the same as DNF driver")
  end

  def set_current_race
    next_race = F1Facade.new.get_schedule(user.seasons.max.season_year)
    race_array = next_race[:MRData][:RaceTable][:Races]
    current_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first
    current_race[:Circuit][:circuitId]
  end

  def assign_finish_position
    finish = F1Facade.new.get_latest_race

    return unless circuit_id == finish[:MRData][:RaceTable][:Races][0][:Circuit][:circuitId]

    finish[:MRData][:RaceTable][:Races][0][:Results].each do |result|
      # require 'pry'; binding.pry
      if driver_id_dnf == result[:Driver][:driverId] && result[:positionText] == 'R' && result[:position] == '20'
        update(dnf_finish_position: result[:positionText])
      end
      update(tenth_finish_position: result[:position]) if driver_id_tenth == result[:Driver][:driverId]
    end
  end

  def calculate_points
    position = tenth_finish_position
    point_value = Constants::POINT_VALUES[position]
    update(points_earned: self.points_earned += point_value) if point_value
  end

  def dnf_points
    return unless dnf_finish_position == 'R'

    update(points_earned: self.points_earned += 10)
  end
end
