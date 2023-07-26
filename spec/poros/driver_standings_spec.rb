require 'rails_helper'

RSpec.describe DriverStandings, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = File.read('spec/fixtures/driver_standings.txt')
      fixted_data = JSON.parse(data, symbolize_names: true)
      standings = DriverStandings.new(fixted_data)
      
      expect(standings).to be_a(DriverStandings)
      expect(standings.constructor).to eq('Red Bull')
      expect(standings.driver_name).to eq('Max Verstappen')
      expect(standings.points).to eq('281')
      expect(standings.position).to eq('1')
    end
  end
end