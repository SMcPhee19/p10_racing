class F1Facade
  def get_drivers(season)
    drivers = service.get_drivers(season)

    drivers[:MRData][:DriverTable][:Drivers].map do |driver|
      Driver.new(driver)
    end
  end

  private

  def service
    @_service ||= F1Service.new
  end
end
