# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @season = Season.create!(season_year: 2023)
    @user = User.create!(name: 'Max Verstappen', username: 'MaxRacer33', pw_salt: '1a2b3c4d-5e6f-7g8h-9i10-j11k12l13m14',
                         pw_hash: '6f7ab8c9d10e11f12g13h14i15j16k17l18m19n20o21p22q23r24s25t26u27v28w29x30y31z32')
    # visit '/'
    # fill_in 'Username', with: 'MaxRacer33'
    # fill_in 'Password', with: 'lew1sGotRobbed!1'
    # click_button 'Login'
    # save_and_open_page
    password = 'lew1sGotRobbed!1'

    # Get the new pw_salt and pw_hash
    pw_salt = SecureRandom.uuid
    prehash = @user.get_pw_salt_concat(pw_salt, password)
    pw_hash = @user.calculate_hash(prehash)

    # Now you can use these values to update the user's pw_salt and pw_hash
    @user.update(pw_salt:, pw_hash:)

    # Display the generated values
    puts "New pw_salt: #{pw_salt}"
    puts "New pw_hash: #{pw_hash}"
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
