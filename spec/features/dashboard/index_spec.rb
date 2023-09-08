# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Application Home Page', vcr: { record: :new_episodes } do
  describe 'happy path' do
    before(:each) do
      visit '/'
      @season = Season.create!(season_year: 2023)
    end

    it 'should have the application name' do
      within '#app_name' do
        expect(page).to have_content('P10 Racing')
      end
    end

    it 'should have text to propt the user to select a season' do
      within '#select_season' do
        expect(page).to have_content('Select a Season')
        expect(page).to have_content('Season Year')
        expect(page).to have_field('season_id')
        expect(page).to have_button('Submit')
      end
    end

    it 'should not have buttons in the header' do
      expect(page).to_not have_button('Leaderboard')
      expect(page).to_not have_button('Season Home')
      expect(page).to_not have_button('All Picks')
    end

    xit 'should have a button to start a new season' do
    end

    it 'the order things appear on the page should be correct' do
      within '#season_wrapper' do
        expect('P10 Racing').to appear_before('Select a Season')
        expect('Select a Season').to appear_before('Season Year')
        expect('Season Year').to appear_before('Submit')
        expect('Submit').to appear_before('Start New Season')
      end
    end

    xit 'the submit button takes you to the right place' do
      select '2023', from: 'season_id'
      click_button 'Submit'
      expect(current_path).to eq(season_path(@season.id))
    end
  end
end
