# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserPicksController, type: :controller, vcr: { record: :new_episodes } do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @season = Season.create!(season_year: 2023)
    @user = User.create!(name: 'Charles Leclerc')
    @user_season = UserSeason.create!(user_id: @user.id, season_id: @season.id)
    @user_pick = UserPick.create!(user_id: @user.id, circuit_id: 'losail', driver_id_dnf: 'stroll',
                                  driver_id_tenth: 'ocon', tenth_finish_position: 7, dnf_finish_position: '', season_id: @season.id) # rubocop:disable Layout/LineLength
  end

  describe 'GET #index' do
    it 'assigns the requested season to @season' do
      get :show, params: { id: @user_pick.to_param }
      expect(assigns(:season)).to eq(@season)
    end

    it 'renders the show template' do
      get :show, params: { id: @user_pick.to_param }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns @season and @user_pick' do
      get :new, params: { season_id: @season.id }
      expect(assigns(:season)).to eq(@season)
      expect(assigns(:user_pick)).to be_a_new(UserPick)
    end

    it 'renders the new template' do
      get :new, params: { season_id: @season.id }
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do # rubocop:disable Metrics/BlockLength
    context 'with valid params' do # rubocop:disable Metrics/BlockLength
      it 'creates a new user_pick' do
        valid_params = {
          user_id: @user.id,
          circuit_id: 'red_bull_ring', # had to use a new track, because of validations on multiple picks by one user for the same race # rubocop:disable Layout/LineLength
          driver_id_dnf: @user_pick.driver_id_dnf,
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        expect do
          post :create, params: { user_pick: valid_params }
        end.to change(UserPick, :count).by(1)
        expect(UserPick.count).to eq(2)
      end

      it 'sets a flash notice' do
        valid_params = {
          user_id: @user.id,
          circuit_id: 'silverstone', # again, had to use a new track, because of validations on multiple picks by one user for the same race # rubocop:disable Layout/LineLength
          driver_id_dnf: @user_pick.driver_id_dnf,
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        post :create, params: { user_pick: valid_params }

        expect(flash[:notice]).to eq('User pick was successfully created.')
      end
    end

    context 'with invalid params' do # rubocop:disable Metrics/BlockLength
      it 'does not create a new user_pick' do
        invalid_params = {
          user_id: @user.id,
          circuit_id: @user_pick.circuit_id,
          driver_id_dnf: @user_pick.driver_id_dnf,
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        expect do
          post :create, params: { user_pick: invalid_params }
        end.to_not change(UserPick, :count)
        expect(assigns(:user_pick)).to be_a_new(UserPick)
      end

      it "redirects to the user's page with an error" do
        invalid_params = {
          user_id: @user.id,
          circuit_id: @user_pick.circuit_id,
          driver_id_dnf: @user_pick.driver_id_dnf,
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        post :create, params: { user_pick: invalid_params }

        expect(flash[:error]).to be_present
        expect(flash[:error]).to eq('Circuit You can only make one user pick per weekend')
      end
    end
  end

  describe 'PATCH #update' do # rubocop:disable Metrics/BlockLength
    context 'with vaild params' do # rubocop:disable Metrics/BlockLength
      it 'updates the user_pick' do
        valid_params = {
          user_id: @user.id,
          circuit_id: 'red_bull_ring',
          driver_id_dnf: 'sargeant',
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        patch :update, params: { id: @user_pick.id, user_pick: valid_params }
        @user_pick.reload
        expect(response).to redirect_to(user_pick_url(@user_pick))
        expect(flash[:notice]).to eq('User pick was successfully updated.')
      end

      it 'responds with JSON' do
        valid_params = {
          user_id: @user.id,
          circuit_id: @user_pick.circuit_id,
          driver_id_dnf: 'sargeant',
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        patch :update, params: { id: @user_pick.id, user_pick: valid_params }

        expect(response).to have_http_status(:found)
        expect(response.location).to eq(user_pick_url(@user_pick))
      end
    end

    context 'with invalid params' do
      it 'renders the edit tempalte' do
        invalid_params = {
          user_id: @user.id,
          circuit_id: '',
          driver_id_dnf: @user_pick.driver_id_dnf,
          driver_id_tenth: @user_pick.driver_id_tenth,
          tenth_finish_position: @user_pick.tenth_finish_position,
          dnf_finish_position: @user_pick.dnf_finish_position,
          season_id: @season.id
        }

        patch :update, params: { id: @user_pick.id, user_pick: invalid_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the user_pick' do
      expect do
        delete :destroy, params: { id: @user_pick.id }
      end.to change(UserPick, :count).by(-1)
    end

    it 'redirects to the user_picks_url' do
      delete :destroy, params: { id: @user_pick.id }

      expect(response).to redirect_to(user_picks_url)
    end

    it 'sets a flash notice' do
      delete :destroy, params: { id: @user_pick.id }

      expect(flash[:notice]).to eq('User pick was successfully destroyed.')
    end
  end
end
