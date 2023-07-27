# frozen_string_literal: true

class DriverStandings
  attr_reader :position,
              :points,
              :driver_name,
              :constructor

  def initialize(data)
    @position = data[:position]
    @points = data[:points]
    @driver_name = "#{data[:Driver][:givenName]} #{data[:Driver][:familyName]}"
    @constructor = data[:Constructors][0][:name]
  end
end
