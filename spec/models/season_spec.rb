# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, vcr: { record: :new_episodes }, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:users).through(:user_seasons) }

    it { should validate_uniqueness_of(:season_year) }
  end

  describe 'instance methods' do
    it 'can get the next race weekend' do
      season = Season.create!(season_year: 2023)
      schedule = F1Facade.new.get_schedule(season.season_year)
      race_array = schedule[:MRData][:RaceTable][:Races]
      next_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first

      expect(season.next_race_weekend).to eq(next_race)
    end
  end
end
