# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserSeason, type: :model do
  describe 'relationshipos' do
    it { should belong_to :user }
    it { should belong_to :season }
    it { should validate_presence_of(:total_points) }
  end

  describe 'model methods' do
    it 'can calculate the total points' do
      user = User.create!(name: 'Bob')
      season = Season.create!(season_year: 2023)
      user_season = UserSeason.create!(user_id: user.id, season_id: season.id)
      UserPick.create!(user_id: user.id, driver_id: 'max_verstappen', circuit_id: 'hungaroring', points_earned: 1,
                       tenth_finish_position: 1)
      UserPick.create!(user_id: user.id, driver_id: 'sainz', circuit_id: 'silverstone', points_earned: 25,
                       tenth_finish_position: 1)

      user_season.calculate_total_points

      expect(user_season.total_points).to eq(26)
    end
  end
end
