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

  private

  def service
    @_service ||= F1Service.new
  end
end
