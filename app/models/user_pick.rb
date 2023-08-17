# frozen_string_literal: true

class UserPick < ApplicationRecord
  belongs_to :user
  has_many :seasons, through: :user_seasons, dependent: :destroy

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

  def self.purify_pick_names
    driver_names = {
      'albon' => 'Alexander Albon',
      'alonso' => 'Fernando Alonso',
      'bottas' => 'Valtteri Bottas',
      'de_vries' => 'Nyck de Vries',
      'gasly' => 'Pierre Gasly',
      'hamilton' => 'Lewis Hamilton',
      'hulkenberg' => 'Nico Hülkenberg',
      'leclerc' => 'Charles Leclerc',
      'kevin_magnussen' => 'Kevin Magnussen',
      'norris' => 'Lando Norris',
      'ocon' => 'Esteban Ocon',
      'perez' => 'Sergio Pérez',
      'piastri' => 'Oscar Piastri',
      'ricciardo' => 'Daniel Ricciardo',
      'russell' => 'George Russell',
      'sainz' => 'Carlos Sainz',
      'sargeant' => 'Logan Sargeant',
      'stroll' => 'Lance Stroll',
      'tsunoda' => 'Yuki Tsunoda',
      'max_verstappen' => 'Max Verstappen',
      'zhou' => 'Guanyu Zhou'
    }

    track_names = {
      'bahrain' => 'Bahrain Grand Prix',
      'jeddah' => 'Saudi Arabian Grand Prix',
      'albert_park' => 'Australian Grand Prix',
      'baku' => 'Azerbaijan Grand Prix',
      'miami' => 'Miami Grand Prix',
      'monaco' => 'Monaco Grand Prix',
      'catalunya' => 'Spanish Grand Prix',
      'villeneuve' => 'Canadian Grand Prix',
      'red_bull_ring' => 'Austrian Grand Prix',
      'silverstone' => 'British Grand Prix',
      'hungaroring' => 'Hungarian Grand Prix',
      'spa' => 'Belgian Grand Prix',
      'zandvoort' => 'Dutch Grand Prix',
      'monza' => 'Italian Grand Prix',
      'marina_bay' => 'Singapore Grand Prix',
      'suzuka' => 'Japanese Grand Prix',
      'losail' => 'Qatar Grand Prix',
      'americas' => 'United States Grand Prix',
      'rodriguez' => 'Mexico City Grand Prix',
      'interlagos' => 'São Paulo Grand Prix',
      'vegas' => 'Las Vegas Grand Prix',
      'yas_marina' => 'Abu Dhabi Grand Prix'
    }

    UserPick.all.each do |pick|
      pick.update(driver_id: driver_names[pick.driver_id_tenth.to_s])
      pick.update(race_name: track_names[pick.circuit_id.to_s])
      pick.update(dnf_name: driver_names[pick.driver_id_dnf.to_s])
    end
  end

  def purify_single_pick
    driver_names = {
      'albon' => 'Alexander Albon',
      'alonso' => 'Fernando Alonso',
      'bottas' => 'Valtteri Bottas',
      'de_vries' => 'Nyck de Vries',
      'gasly' => 'Pierre Gasly',
      'hamilton' => 'Lewis Hamilton',
      'hulkenberg' => 'Nico Hülkenberg',
      'leclerc' => 'Charles Leclerc',
      'kevin_magnussen' => 'Kevin Magnussen',
      'norris' => 'Lando Norris',
      'ocon' => 'Esteban Ocon',
      'perez' => 'Sergio Pérez',
      'piastri' => 'Oscar Piastri',
      'ricciardo' => 'Daniel Ricciardo',
      'russell' => 'George Russell',
      'sainz' => 'Carlos Sainz',
      'sargeant' => 'Logan Sargeant',
      'stroll' => 'Lance Stroll',
      'tsunoda' => 'Yuki Tsunoda',
      'max_verstappen' => 'Max Verstappen',
      'zhou' => 'Guanyu Zhou'
    }

    track_names = {
      'bahrain' => 'Bahrain Grand Prix',
      'jeddah' => 'Saudi Arabian Grand Prix',
      'albert_park' => 'Australian Grand Prix',
      'baku' => 'Azerbaijan Grand Prix',
      'miami' => 'Miami Grand Prix',
      'monaco' => 'Monaco Grand Prix',
      'catalunya' => 'Spanish Grand Prix',
      'villeneuve' => 'Canadian Grand Prix',
      'red_bull_ring' => 'Austrian Grand Prix',
      'silverstone' => 'British Grand Prix',
      'hungaroring' => 'Hungarian Grand Prix',
      'spa' => 'Belgian Grand Prix',
      'zandvoort' => 'Dutch Grand Prix',
      'monza' => 'Italian Grand Prix',
      'marina_bay' => 'Singapore Grand Prix',
      'suzuka' => 'Japanese Grand Prix',
      'losail' => 'Qatar Grand Prix',
      'americas' => 'United States Grand Prix',
      'rodriguez' => 'Mexico City Grand Prix',
      'interlagos' => 'São Paulo Grand Prix',
      'vegas' => 'Las Vegas Grand Prix',
      'yas_marina' => 'Abu Dhabi Grand Prix'
    }

    update(driver_id: driver_names[driver_id_tenth.to_s])
    update(race_name: track_names[circuit_id.to_s])
    update(dnf_name: driver_names[driver_id_dnf.to_s])
  end
end
