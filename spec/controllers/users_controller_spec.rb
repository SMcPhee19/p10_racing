# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @user1 = User.create!(name: 'Oscar Piastri', pw_salt: 'some_salt', pw_hash: '58b720e4892fb1975904b11d460add8d')
    @user2 = User.create!(name: 'Kevin Magnussen', pw_salt: 'random_salt')
    @user3 = User.create!(name: 'Lando Norris', pw_salt: 'secure_salt')
    @user4 = User.create!(name: 'Lewis Hamilton', pw_salt: 'unique_salt')
    @user5 = User.create!(name: 'Alex Albon', pw_salt: 'user_salt')
    @season = Season.create(season_year: 2023)
  end

  describe 'GET #index' do
    it 'assigns all users to @users' do
      get :index

      expect(assigns(:users)).to match_array([@user1, @user2, @user3, @user4, @user5])
    end

    it 'renders the index tempalte' do
      get :index

      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'assigns the last season to the user' do
      get :new

      expect(assigns(:season)).to eq(@season)
    end

    it 'assings a new user to @user' do
      get :new

      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { name: 'Zhou Guanyu' } }
    let(:invalid_attributes) { { name: '' } }

    context 'with valid attributes' do
      it 'creates a new user' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'creates a UserSeason record' do
        expect do
          post :create, params: { user: valid_attributes }
        end.to change(UserSeason, :count).by(1)
      end

      it 'redirects to the root path' do
        post :create, params: { user: valid_attributes }
        expect(response).to redirect_to('/')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user' do
        expect do
          post :create, params: { user: invalid_attributes }
        end.not_to change(User, :count)
      end

      it 'renders the new tempalte' do
        post :create, params: { user: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PATCH #update' do
    let(:valid_attributes) { { name: 'Sergio Perez' } }
    let(:invalid_attributes) { { name: '' } }

    context 'with vaild attributes' do
      it 'updates the user' do
        patch :update, params: { id: @user1.id, user: valid_attributes }
        @user1.reload

        expect(@user1.name).to eq('Sergio Perez')
      end

      it 'redirects to the user show page' do
        patch :update, params: { id: @user2.id, user: valid_attributes }
        expect(response).to redirect_to(user_path(@user2))
      end
    end

    context 'with invalid attributes' do
      it 'does not update the user' do
        patch :update, params: { id: @user3.id, user: invalid_attributes }
        @user3.reload

        expect(@user3.name).to_not eq('')
      end

      it 'renders the edit template' do
        patch :update, params: { id: @user4, user: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the user' do
      expect do
        delete :destroy, params: { id: @user1.id }
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the users index page' do
      delete :destroy, params: { id: @user1.id }
      expect(response).to redirect_to(users_path)
    end
  end
end
