# frozen_string_literal: true

class F1Facade
  def get_drivers(season)
    drivers = service.get_drivers(season)

    drivers[:MRData][:DriverTable][:Drivers].map do |driver|
      Driver.new(driver)
    end
  end

  def get_result(season, round)
    result = service.get_result(season, round)

    RaceResult.new(result)
  end

  def get_constructors(season)
    constructors = service.get_constructors(season)

    constructors[:MRData][:ConstructorTable][:Constructors].map do |constructor|
      Constructor.new(constructor)
    end
  end

  def get_schedule(season)
    # schedule = service.get_schedule(season)
    # Schedule.new(schedule)
    service.get_schedule(season)
  end

  def get_driver_standings(season)
    driver_standings = service.get_driver_standings(season)
    if driver_standings[:MRData][:StandingsTable][:StandingsLists].empty?
      'Driver Standings are not yet available'
    else
      driver_standings[:MRData][:StandingsTable][:StandingsLists][0][:DriverStandings].map do |driver|
        DriverStandings.new(driver)
      end
    end
  end

  def get_constructor_standings(season)
    constructor_standings = service.get_constructor_standings(season)
    if constructor_standings[:MRData][:StandingsTable][:StandingsLists].empty?
      'Constructor Standings are not availble yet'
    else
      constructor_standings[:MRData][:StandingsTable][:StandingsLists][0][:ConstructorStandings].map do |constructor|
        ConstructorStandings.new(constructor)
      end
    end
  end

  def get_latest_race
    service.get_latest_race
  end

  private

  def service
    @service ||= F1Service.new
  end
end
