# frozen_string_literal: true

class UserPick < ApplicationRecord
  belongs_to :user
  has_many :seasons, through: :user_seasons

  validates_presence_of :user_id, :circuit_id

  def set_current_race
    next_race = F1Facade.new.get_schedule(self.user.seasons.sort.last.season_year)
    race_array = next_race[:MRData][:RaceTable][:Races]
    current_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first
    current_race_name = current_race[:Circuit][:circuitId]
  end

  def assign_finish_position
    finish = F1Facade.new.get_latest_race

    if self.circuit_id == finish[:MRData][:RaceTable][:Races][0][:Circuit][:circuitId]
      finish[:MRData][:RaceTable][:Races][0][:Results].each do |result|
        if self.driver_id == result[:Driver][:driverId]
          self.update(finish_position: result[:position])
        end
      end
    end
  end

  def calculate_points
    position = self.finish_position
    point_value = Constants::POINT_VALUES[position]
    self.points_earner(points_earned: point_value) if point_value
  end
end

# finish[:MRData][:RaceTable][:Races][0][:raceName]

# def assign_finish_position
#   finish = F1Facade.new.get_latest_race
#   latest_race_results = finish[:MRData][:RaceTable][:Races][0][:Results]

#   # Make sure the race is the correct race
#   if self.circuit_id == finish[:MRData][:RaceTable][:Races][0][:Circuit][:circuitId]
#     latest_race_results.each do |result|
#       if self.driver_id == result[:Driver][:driverId]
#         # Update the finish_position attribute for the current model instance
#         self.update(finish_position: result[:position])
#         break # Exit the loop once the driver's finish position is found
#       end
#     end
#   end
# end
