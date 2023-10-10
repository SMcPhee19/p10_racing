# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:seasons).through(:user_seasons) }
    it { should have_many(:user_picks) }

    it { should validate_presence_of(:name) }
  end

  # describe 'model methods' do
  #   it 'can calculate the total points' do
  #     user = User.create!(name: 'Bob', total_points: 0)
  #     season = Season.create!(season_year: 2023)
  #     UserSeason.create!(user_id: user.id, season_id: season.id)
  #     UserPick.create!(user_id: user.id, driver_id: 'max_verstappen', circuit_id: 'hungaroring', points_earned: 1,
  #                      tenth_finish_position: 1)
  #     UserPick.create!(user_id: user.id, driver_id: 'sainz', circuit_id: 'silverstone', points_earned: 25,
  #                      tenth_finish_position: 1)

  #     user.calculate_total_points

  #     expect(user.total_points).to eq(26)
  #   end
  # end
end
