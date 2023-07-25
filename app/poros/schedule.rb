# frozen_string_literal: true

class Schedule
  attr_reader :season

  def initialize(data)
    @season = data[:MRData][:RaceTable][:Races]
  end
end
