# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConstructorStandings, vcr: { record: :new_episodes }, type: :poro do
  describe 'initialize' do
    it 'exists and has attributes' do
      data = File.read('spec/fixtures/constructor_standings.txt')
      fixed_data = JSON.parse(data, symbolize_names: true)
      standings = ConstructorStandings.new(fixed_data)

      expect(standings).to be_a(ConstructorStandings)
      expect(standings.constructor_name).to eq('Red Bull')
      expect(standings.points).to eq('452')
      expect(standings.position).to eq('1')
      expect(standings.wins).to eq('11')
    end
  end
end
