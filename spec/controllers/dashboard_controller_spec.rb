require 'rails_helper'

RSpec.describe DashboardController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @season = Season.create!(season_year: 2023)
  end

  describe 'GET #index' do
    it 'assigns @hide_header when season_id is present' do
      get :index, params: { season_id: @season.id }

      expect(assigns(:hide_header)).to be_truthy
    end

    it 'redirects to season_path when season_id is present' do
      get :index, params: { season_id: @season.id }

      expect(response).to redirect_to(season_path(@season.id))
    end
  end
end