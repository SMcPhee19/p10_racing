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
    schedule = service.get_schedule(season)

    Schedule.new(schedule)
  end

  private

  def service
    @service ||= F1Service.new
  end
end
