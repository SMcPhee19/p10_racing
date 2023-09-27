# frozen_string_literal: true

require 'rails_helper'


RSpec.describe UserPick, vcr: { record: :new_episodes }, type: :model do
  describe 'relationships and validations' do
    it { should belong_to :user }

    it { should validate_presence_of :user_id }
  end

  describe 'model methods' do
    before(:each) do
      @user = User.create!(name: 'Bob', total_points: 0)
      @user2 = User.create!(name: 'Joe', total_points: 0)
      @season = Season.create!(season_year: 2023)
      UserSeason.create!(user_id: @user.id, season_id: @season.id)
      UserSeason.create!(user_id: @user2.id, season_id: @season.id)
    end

    it 'can assign the finish position' do
      @user_pick = UserPick.create!(user_id: @user.id, circuit_id: 'spa', driver_id_dnf: 'ocon',
                                    driver_id_tenth: 'hamilton', points_earned: 1, tenth_finish_position: 1, dnf_finish_position: 'R')
      @user_pick.assign_finish_position

      expect(@user_pick.tenth_finish_position).to eq(1)
    end

    it 'can calculate the points earned' do
      @circuit_id = @season.last_race_weekend[:Circuit][:circuitId]
      @user_pick = UserPick.create!(user_id: @user.id, circuit_id: @circuit_id, driver_id_dnf: 'ocon',
                                    driver_id_tenth: 'max_verstappen', tenth_finish_position: nil, dnf_finish_position: '')
      @user_pick2 = UserPick.create!(user_id: @user2.id, circuit_id: @circuit_id, driver_id_dnf: 'gasly',
                                     driver_id_tenth: 'stroll', tenth_finish_position: nil, dnf_finish_position: '')
                               
      @user_pick.assign_finish_position
      @user_pick2.assign_finish_position
      
      @user_pick.calculate_points
      @user_pick2.calculate_points
      
      @user_pick.dnf_points
      @user_pick2.dnf_points
      
      @pick_points1 = @user_pick.points_earned
      @pick_points2 = @user_pick2.points_earned

      expect(@user_pick.points_earned).to eq(@pick_points1)
      expect(@user_pick2.points_earned).to eq(@pick_points2)
    end

    it 'add an error if the same driver is picked' do
      @user_pick = UserPick.new(user_id: @user.id, circuit_id: 'hungaroring', driver_id_dnf: 'ocon',
                                driver_id_tenth: 'ocon', tenth_finish_position: nil, dnf_finish_position: '')
      @user_pick.valid?

      expect(@user_pick.errors.full_messages).to eq(["Driver id tenth can't be the same as DNF driver"])
    end

    it "doesn't add an error if the same driver is not picked" do
      @user_pick = UserPick.new(user_id: @user.id, circuit_id: 'hungaroring', driver_id_dnf: 'ocon',
                                driver_id_tenth: 'hamilton', tenth_finish_position: nil, dnf_finish_position: '')
      @user_pick.valid?

      expect(@user_pick.errors.full_messages).to be_empty
    end

    it 'can set the current race' do
      @user_pick = UserPick.new(user_id: @user.id, circuit_id: '', driver_id_dnf: 'russell',
                                driver_id_tenth: 'hamilton', tenth_finish_position: nil, dnf_finish_position: '')

      fixed_date = '2023-07-30'
      Timecop.freeze(fixed_date)

      current_race = @user_pick.set_current_race
      expect(current_race).to eq('spa')
    end

    it 'updates driver and track names for all UserPicks' do
      @pick1 = UserPick.create!(user_id: @user.id, driver_id_tenth: 'leclerc', circuit_id: 'spa', driver_id_dnf: 'ocon')
      @pick2 = UserPick.create!(user_id: @user.id, driver_id_tenth: 'hamilton', circuit_id: 'monaco',
                                driver_id_dnf: 'ricciardo')

      UserPick.purify_pick_names

      @pick1.reload
      @pick2.reload

      expect(@pick1.driver_id).to eq('Charles Leclerc')
      expect(@pick1.race_name).to eq('Belgian Grand Prix')
      expect(@pick1.dnf_name).to eq('Esteban Ocon')

      expect(@pick2.driver_id).to eq('Lewis Hamilton')
      expect(@pick2.race_name).to eq('Monaco Grand Prix')
      expect(@pick2.dnf_name).to eq('Daniel Ricciardo')
    end

    it 'updates driver and track names for a single UserPick' do
      @pick1 = UserPick.create!(user_id: @user.id, driver_id_tenth: 'leclerc', circuit_id: 'spa', driver_id_dnf: 'ocon')

      @pick1.purify_single_pick

      @pick1.reload

      expect(@pick1.driver_id).to eq('Charles Leclerc')
      expect(@pick1.race_name).to eq('Belgian Grand Prix')
      expect(@pick1.dnf_name).to eq('Esteban Ocon')
    end
  end
end
