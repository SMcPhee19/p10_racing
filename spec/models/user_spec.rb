# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships and validations' do
    it { should have_many(:user_seasons) }
    it { should have_many(:seasons).through(:user_seasons) }
    it { should have_many(:user_picks) }
    it { should have_many(:users_x_userclaims) }
    it { should have_many(:user_claims).through(:users_x_userclaims) }

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

  describe '#validate_user_password' do
    it 'returns true for a valid password' do
      user1 = User.create!(name: 'Oscar Piastri', pw_salt: 'some_salt', pw_hash: '58b720e4892fb1975904b11d460add8d')
      valid_password = '@goodPassword1'
      expect(user1.validate_user_password(valid_password)).to be_truthy
    end

    it 'returns false for a invalid password' do
      user12 = User.create!(name: 'Carlos Sainz', pw_salt: 'some_salt', pw_hash: 'notactuallyahash')
      invalid_password = '@'
      expect(!user12.validate_user_password(invalid_password)).to be_truthy
    end
  end

  describe '#update_user_password' do
    context 'when user password meets requirements' do
      it 'returns true and saves the password' do
        user1 = User.create!(name: 'Oscar Piastri', pw_salt: 'some_salt', pw_hash: '58b720e4892fb1975904b11d460add8d')
        valid_password = '@goodPassword1'
        expect(user1.update_user_password(valid_password)).to be true
      end
    end

    context 'when password fails validations' do
      it 'returns false and provides validation errors' do
        user12 = User.create!(name: 'Carlos Sainz', pw_salt: 'some_salt', pw_hash: 'notactuallyahash')
        invalid_password = '@1'
        expect(user12.update_user_password(invalid_password)).to be false
      end
    end
  end
end
