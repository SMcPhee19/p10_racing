# frozen_string_literal: true

require 'rails_helper'
require 'timecop'

RSpec.describe 'Season Home Page', vcr: { record: :new_episodes } do
  describe 'happy path' do
    before(:each) do
      @season = Season.create!(season_year: 2023)
      @user1 = User.create!(name: 'Charles Leclerc')
      @user2 = User.create!(name: 'Lewis Hamilton')
      @user3 = User.create!(name: 'George Russell')
      @user4 = User.create!(name: 'Lando Norris')
      @user5 = User.create!(name: 'Alex Albon')
      @user6 = User.create!(name: 'Yuki Tsunoda')
      UserSeason.create!(user_id: @user1.id, season_id: @season.id, total_points: 101)
      UserSeason.create!(user_id: @user2.id, season_id: @season.id, total_points: 134)
      UserSeason.create!(user_id: @user3.id, season_id: @season.id, total_points: 161)
      UserSeason.create!(user_id: @user4.id, season_id: @season.id, total_points: 187)
      UserSeason.create!(user_id: @user5.id, season_id: @season.id, total_points: 110)
      UserSeason.create!(user_id: @user6.id, season_id: @season.id, total_points: 199)
      @user_pick1 = UserPick.create!(user_id: @user1.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      @user_pick2 = UserPick.create!(user_id: @user2.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      @user_pick3 = UserPick.create!(user_id: @user3.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      @user_pick4 = UserPick.create!(user_id: @user4.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      @user_pick5 = UserPick.create!(user_id: @user5.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      @user_pick6 = UserPick.create!(user_id: @user6.id, circuit_id: 'jeddah', driver_id_dnf: 'piastri',
        driver_id_tenth: 'bottas', tenth_finish_position: 18, dnf_finish_position: '')
      fixed_date = '2023-09-09'
      Timecop.freeze(fixed_date)
      visit season_path(@season)
    end

    it 'the page header should have button once a season is chosen' do
      within '#page_header' do
        expect(page).to have_button('Leaderboard')
        expect(page).to have_button('Season Home')
        expect(page).to have_button('All Picks')
      end
    end

    it 'the header leaderboard button should take you to the right place' do
      within '#page_header' do
        click_button 'Leaderboard'
        expect(current_path).to eq('/leaderboard')
      end
    end

    it 'the header season home button should take you to the right place' do
      within '#page_header' do
        click_button 'Season Home'
        expect(current_path).to eq(season_path(@season.id))
      end
    end

    it 'the header all picks button should take you to the right place' do
      within '#page_header' do
        click_button 'All Picks'
        expect(current_path).to eq(user_picks_path)
      end
    end

    it 'page has a title and year' do
      within '#page_title' do
        expect(page).to have_content('Season at a Glance')
      end

      within '#season_year' do
        expect(page).to have_content("Season Year: #{@season[:season_year]}")
      end
    end

    it 'page has buttons to all users show page and to new user' do
      within '#all_users' do
        User.all.each do |user|
          expect(page).to have_button(user.name)
          click_button user.name
          expect(current_path).to eq(user_path(user.id))
          visit season_path(@season)
        end
        expect(page).to have_link('New User')
      end
    end

    it 'page has a drivers standings table' do
      within '#driver_table' do
        expect(page).to have_content('Driver Standings:')
        expect(page).to have_css('table', text: 'Position')
        expect(page).to have_css('table', text: 'Points')
        expect(page).to have_css('table', text: 'Driver Name')
        expect(page).to have_css('table', text: 'Constructor')
      end
    end

    it 'page has a constructors standings table' do
      within '#constructor_table' do
        expect(page).to have_content('Constructor Standings:')
        expect(page).to have_css('table', text: 'Position')
        expect(page).to have_css('table', text: 'Constructor')
        expect(page).to have_css('table', text: 'Wins')
        expect(page).to have_css('table', text: 'Points')
      end
    end

    it 'has a details for the next race - non-sprint weekend' do
      fixed_date = '2023-09-09'
      Timecop.freeze(fixed_date)

      within '#next_race' do
        expect(page).to have_content('Next Race: Singapore Grand Prix')
        expect(page).to have_content('Circuit: Marina Bay Street Circuit')
        expect(page).to have_content('Dates:')
        expect(page).to have_content('Race: September 17: 06:00 AM')
        expect(page).to have_content('Free Practice 1: September 15: 03:30 AM')
        expect(page).to have_content('Free Practice 2: September 15: 07:00 AM')
        expect(page).to have_content('Free Practice 3: September 16: 03:30 AM')
        expect(page).to have_content('Qualifying: September 16: 07:00 AM')

        Timecop.return
      end
    end 
  end
end
