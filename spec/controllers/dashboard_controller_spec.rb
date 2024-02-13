# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @season = Season.create!(season_year: 2023)
    @user = User.create!(name: 'Max Verstappen', username: 'MaxRacer33', pw_salt: '1a2b3c4d-5e6f-7g8h-9i10-j11k12l13m14', # rubocop:disable Layout/LineLength
                         pw_hash: '6f7ab8c9d10e11f12g13h14i15j16k17l18m19n20o21p22q23r24s25t26u27v28w29x30y31z32')
    log_in_user(@user)
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
