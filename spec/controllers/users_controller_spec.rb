require 'rails_helper'

RSpec.describe UsersController, type: :controller, vcr: { record: :new_episodes } do
  before(:each) do
    @user1 = User.create!(name: 'Oscar Piastri')
    @user2 = User.create!(name: 'Kevin Magnussen')
    @user3 = User.create!(name: 'Lando Norris')
    @user4 = User.create!(name: 'Lewis Hamilton')
    @user5 = User.create!(name: 'Alex Albon')
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

  describe ''
end