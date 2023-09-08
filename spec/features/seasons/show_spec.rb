# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Season Home Page', vcr: { record: :new_episodes } do
  describe 'happy path' do
    before(:each) do
      @season = Season.create!(season_year: 2023)
      @user1 = User.create!(name: 'Charles', total_points: 101)
      @user2 = User.create!(name: 'Lewis', total_points: 134)
      @user3 = User.create!(name: 'George', total_points: 161)
      @user4 = User.create!(name: 'Lando', total_points: 187)
      @user5 = User.create!(name: 'Alex', total_points: 110)
      @user6 = User.create!(name: 'Yuki', total_points: 199)
      UserSeason.create!(user_id: @user1.id, season_id: @season.id)
      UserSeason.create!(user_id: @user2.id, season_id: @season.id)
      UserSeason.create!(user_id: @user3.id, season_id: @season.id)
      UserSeason.create!(user_id: @user4.id, season_id: @season.id)
      UserSeason.create!(user_id: @user5.id, season_id: @season.id)
      UserSeason.create!(user_id: @user6.id, season_id: @season.id)
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
  end
end
