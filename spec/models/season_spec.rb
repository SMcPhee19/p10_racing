# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Season, vcr: { record: :new_episodes }, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:users).through(:user_seasons) }

    it { should validate_uniqueness_of(:season_year) }
  end

  describe 'model methods' do
    before(:each) do
      @user = User.create!(name: 'Bob', total_points: 0)
      @user2 = User.create!(name: 'Joe', total_points: 0)
      @season = Season.create!(season_year: 2023)
      @schedule = F1Facade.new.get_schedule(@season.season_year)
      UserSeason.create!(user_id: @user.id, season_id: @season.id)
      UserSeason.create!(user_id: @user2.id, season_id: @season.id)
    end

    it 'can get the next race weekend' do
      race_array = @schedule[:MRData][:RaceTable][:Races]
      next_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first

      expect(@season.next_race_weekend).to eq(next_race)
    end

    it 'can can get the last race weekend' do
      fixed_date = '2023-07-30'
      Timecop.freeze(fixed_date)
      last_race = @season.last_race_weekend

      expect(last_race[:raceName]).to eq('Belgian Grand Prix')
      expect(last_race[:Circuit][:circuitId]).to eq('spa')
    end
  end
end
