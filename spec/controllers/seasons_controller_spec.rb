# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeasonsController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @user1 = User.create!(name: 'Charles Leclerc')
    @user2 = User.create!(name: 'Lewis Hamilton')
    @user3 = User.create!(name: 'George Russell')
    @user4 = User.create!(name: 'Lando Norris')
    @user5 = User.create!(name: 'Alex Albon')
    @user6 = User.create!(name: 'Yuki Tsunoda')
  end

  describe 'GET #index' do
    it 'assigns @seasons and renders the index template' do
      Season.create!(season_year: 2023)
      Season.create!(season_year: 2022)
      Season.create!(season_year: 2021)

      get :index

      expect(assigns(:seasons).count).to eq(3)
      expect(assigns(:seasons)).to eq(Season.all)
      expect(response).to render_template('index')
    end

    it 'renders JSON when format is requested' do
      Season.create!(season_year: 2023)
      Season.create!(season_year: 2022)
      Season.create!(season_year: 2021)

      get :index, format: :json

      expect(assigns(:seasons).count).to eq(3)
      expect(assigns(:seasons)).to eq(Season.all)
      expect(response).to render_template('index')
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET #new' do
    it 'assigns a new Season to @season' do
      get :new
      expect(assigns(:season)).to be_a_new(Season)
    end

    it 'sets @hide_header to true' do
      get :new
      expect(assigns(:hide_header)).to be(true)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    it 'should create season and associated user_seasons - happy path' do
      expect(Season.count).to eq(0)
      expect do
        post :create, params: { season: { season_year: 2023 } }
      end.to change(Season, :count).by(1)
      expect(response).to redirect_to(season_path(Season.last.id))
      expect(Season.last.user_seasons.count).to eq(6)

      Season.last.users.each do |associated_user|
        expect(associated_user.user_seasons.last.total_points).to eq(0)
        expect(associated_user.user_seasons.last.season_id).to eq(Season.last.id)
      end
    end

    it 'should not create season if season_year is empty - sad path' do
      expect(Season.count).to eq(0)
      expect do
        post :create, params: { season: { season_year: '' } }, format: :html
      end.to_not change(Season, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the requested season' do
        season = Season.create!(season_year: 2022)

        put :update, params: { id: season.to_param, season: { season_year: '2023' } }
        season.reload

        expect(season.season_year).to_not eq('2022')
        expect(season.season_year).to eq('2023')
      end

      it 'redirects to the season' do
        season = Season.create!(season_year: 2022)

        put :update, params: { id: season.to_param, season: { season_year: '2023' } }
        expect(response).to redirect_to(season_path(season.id))
      end
    end

    context 'with invalid attributes' do
      it 'renders the edit template' do
        season = Season.create!(season_year: 2022)
        put :update, params: { id: season.to_param, season: { season_year: '' } }

        expect(response).to render_template(:edit)
      end

      it 'returns an error message (unprocessable_entity)' do
        season = Season.create!(season_year: 2022)
        put :update, params: { id: season.to_param, season: { season_year: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested season' do
      season = Season.create!(season_year: 2022)
      Season.create!(season_year: 2023)

      expect(Season.count).to eq(2)
      expect do
        delete :destroy, params: { id: season.to_param }
      end.to change(Season, :count).by(-1)
      expect(Season.count).to eq(1)
    end

    it 'redirects to the seasons list' do
      season = Season.create!(season_year: 2022)
      Season.create!(season_year: 2023)

      delete :destroy, params: { id: season.to_param }
      expect(response).to redirect_to(seasons_path)
    end
  end
end
