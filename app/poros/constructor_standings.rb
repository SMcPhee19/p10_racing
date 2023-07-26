class ConstructorStandings
  attr_reader :position,
              :points,
              :wins,
              :constructor_name
              
  def initialize(data)
    @position = data[:position]
    @points = data[:points]
    @wins = data[:wins]
    @constructor_name = data[:Constructor][:name]
  end
end