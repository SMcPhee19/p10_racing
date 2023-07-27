# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPick, vcr: { record: :new_episodes}, type: :model do
  describe 'relationships and validations' do
    it { should belong_to :user }

    it { should validate_presence_of :user_id }
  end

  describe 'model methods' do
    it 'can set the current race' do
      actual_next_race = "spa"
      user = User.create!(name: "Bob", total_points: 0)
      season = Season.create!(season_year: 2023)
      UserSeason.create!(user_id: user.id, season_id: season.id)
      user_pick = UserPick.create!(user_id: user.id, driver_id: "max_verstappen", circuit_id: "spa", points_earned: 1, finish_position: 1)

      expect(user_pick.set_current_race).to eq(actual_next_race)
    end

    it 'can assign the finish position' do
      user = User.create!(name: "Bob", total_points: 0)
      season = Season.create!(season_year: 2023)
      UserSeason.create!(user_id: user.id, season_id: season.id)
      user_pick = UserPick.create!(user_id: user.id, driver_id: "max_verstappen", circuit_id: "hungaroring", points_earned: nil, finish_position: nil)
      user_pick.assign_finish_position

      expect(user_pick.finish_position).to eq(1)
    end

    it 'can calculate the points earned' do
      user = User.create!(name: "Bob", total_points: 0)
      user2 = User.create!(name: "Joe", total_points: 0)
      season = Season.create!(season_year: 2023)
      UserSeason.create!(user_id: user.id, season_id: season.id)
      UserSeason.create!(user_id: user2.id, season_id: season.id)
      user_pick = UserPick.create!(user_id: user.id, driver_id: "max_verstappen", circuit_id: "hungaroring", points_earned: nil, finish_position: nil)
      user_pick2 = UserPick.create!(user_id: user2.id, driver_id: "stroll", circuit_id: "hungaroring", points_earned: nil, finish_position: nil)

      user_pick.assign_finish_position
      user_pick2.assign_finish_position

      user_pick.calculate_points
      user_pick2.calculate_points

      expect(user_pick.points_earned).to eq(1)
      expect(user_pick2.points_earned).to eq(25)
    end
  end
end
