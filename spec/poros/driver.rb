require 'rails_helper'

RSpec.describe Driver, vcr:{record: :new_episodes}, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = { 
        "driverId": "hamilton",
        "permanentNumber": "44",
        "code": "HAM",
        "givenName": "Lewis",
        "familyName": "Hamilton",
        "dateOfBirth": "1985-01-07",
        "nationality": "British"
     }
      driver = Driver.new(data)

      expect(driver).to be_a(Driver)
      expect(driver.name).to eq("Lewis Hamilton")
      expect(driver.driver_id).to eq("hamilton")
      expect(driver.code).to eq("HAM")
      expect(driver.driver_number).to eq("44")
      expect(driver.date_of_birth).to eq("1985-01-07")
      expect(driver.nationality).to eq("British")
    end
  end
end