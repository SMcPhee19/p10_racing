# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Season Home Page', vcr: { record: :new_episodes } do
  describe 'happy path' do
    before(:each) do
      @season = Season.create!(season_year: 2023)
      @user = User.create!(name: 'Bob', total_points: 0)
      visit season_path(@season)
    end

    it 'should have a page header' do
      save_and_open_page
    end
  end
end
