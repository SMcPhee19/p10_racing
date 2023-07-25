# frozen_string_literal: true

class RaceResult
  attr_reader :season,
              :round,
              :race_name,
              :circuit,
              :location,
              :date,
              :time,
              :result

  def initialize(data)
    @season = data[:MRData][:RaceTable][:season]
    @round = data[:MRData][:RaceTable][:round]
    @race_name = data[:MRData][:RaceTable][:Races][0][:raceName]
    @circuit = data[:MRData][:RaceTable][:Races][0][:Circuit][:circuitName]
    @location = "#{data[:MRData][:RaceTable][:Races][0][:Circuit][:Location][:locality]}, #{data[:MRData][:RaceTable][:Races][0][:Circuit][:Location][:country]}"
    @date = data[:MRData][:RaceTable][:Races][0][:date]
    @time = data[:MRData][:RaceTable][:Races][0][:time]
    @result = data[:MRData][:RaceTable][:Races][0][:Results]
  end
end
