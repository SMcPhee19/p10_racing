# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RaceResult, vcr: { record: :new_episodes }, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = File.read('spec/fixtures/race_result.txt')
      fixed_data = JSON.parse(data, symbolize_names: true)
      result = RaceResult.new(fixed_data)

      expect(result).to be_a(RaceResult)
      expect(result.season).to eq('2023')
      expect(result.round).to eq('11')
      expect(result.race_name).to eq('Hungarian Grand Prix')
      expect(result.circuit).to eq('Hungaroring')
      expect(result.location).to eq('Budapest, Hungary')
      expect(result.date).to eq('2023-07-23')
      expect(result.time).to eq('13:00:00Z')
      expect(result.result).to be_an(Array)
      expect(result.result.count).to eq(20)
    end
  end
end
