class Driver
  attr_reader :name, 
              :driver_id,
              :driver_number,
              :date_of_birth, 
              :nationality,
              :code

  def initialize(data)
    @name = "#{data[:givenName]} #{data[:familyName]}"
    @driver_id = data[:driverId]
    @driver_number = data[:permanentNumber]
    @date_of_birth = data[:dateOfBirth]
    @nationality = data[:nationality]
    @code = data[:code]
  end
end