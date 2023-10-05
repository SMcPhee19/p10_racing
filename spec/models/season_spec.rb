# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

RSpec.describe Season, vcr: { record: :new_episodes }, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:users).through(:user_seasons) }

    it { should validate_uniqueness_of(:season_year) }
  end

  describe 'model methods' do
    before(:each) do
      @user = User.create!(name: 'Bob')
      @user2 = User.create!(name: 'Joe')
      @season = Season.create!(season_year: 2023)
      @schedule = F1Facade.new.get_schedule(@season.season_year)
      UserSeason.create!(user_id: @user.id, season_id: @season.id)
      UserSeason.create!(user_id: @user2.id, season_id: @season.id)
    end

    it 'can get the next race weekend' do
      race_array = @schedule[:MRData][:RaceTable][:Races]
      next_race = race_array.select { |race| Date.parse(race[:date]) > Date.today }.first

      expect(@season.next_race_weekend("2023")).to eq(next_race)
    end

    it 'can can get the last race weekend' do
      last_race = @season.last_race_weekend
      last_race_name = @season.last_race_weekend[:raceName]
      last_race_id = @season.last_race_weekend[:Circuit][:circuitId]

      expect(last_race[:raceName]).to eq(last_race_name)
      expect(last_race[:Circuit][:circuitId]).to eq(last_race_id)
    end

    it 'next_race no longer changes to the next race weekend early' do
      race_array = @schedule[:MRData][:RaceTable][:Races]

      pre_race_time = Time.new(2023, 8, 27, 0o6, 59, 59).in_time_zone('Mountain Time (US & Canada)') # Aug 27, 2023 6:59:59 AM MST, this race was at 7:00 AM MST
      Timecop.freeze(pre_race_time)
      next_race = race_array.select { |race| Date.parse(race[:date]) >= Date.today }.first

      expect(next_race[:raceName]).to eq('Dutch Grand Prix')
      Timecop.return

      post_race_time = Time.new(2023, 8, 28, 0, 0, 0).in_time_zone('Mountain Time (US & Canada)') # Aug 28, 2023 12:00 AM MST
      Timecop.freeze(post_race_time)
      next_race = race_array.select { |race| Date.parse(race[:date]) >= Date.today }.first

      expect(next_race[:raceName]).to eq('Italian Grand Prix')
      Timecop.return
    end
  end
end
