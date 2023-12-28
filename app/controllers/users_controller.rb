# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @season = Season.find(params[:season_id])
    @user = User.find(params[:id])
    @user_season = UserSeason.where(user_id: @user, season_id: @season)
    @next_race = @season.next_race_weekend(@season.season_year)

    # if @next_race.class != NilClass
    if @next_race.present?
      @qualifying = F1Service.new.get_qualifying(@season.season_year, @next_race[:round])
    else
      'This Season Is Over. Please Select A Different Season.'
    end
    # @qualifying = F1Service.new.get_qualifying(@user.seasons.last.season_year, 11)
    @drivers = F1Facade.new.get_drivers(@user.seasons.where(id: @season.id).first.season_year)
    @position = 1
  end

  # GET /users/new
  def new
    @season = Season.last
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @season = Season.last
    respond_to do |format|
      if @user.save
        UserSeason.create!(user_id: @user.id, season_id: @season.id)
        format.html { redirect_to '/', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
