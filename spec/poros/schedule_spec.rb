require 'rails_helper'

RSpec.describe Schedule, vcr:{record: :new_episodes}, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = File.read('spec/fixtures/schedule.json')
      fixed_data = JSON.parse(data, symbolize_names: true)

      schedule = Schedule.new(fixed_data)

      expect(schedule).to be_a(Schedule)
      expect(schedule.season).to be_an(Array)
      expect(schedule.season.count).to eq(22)
    end
  end
end