# frozen_string_literal: true

class UserSeasonsController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_user_season, only: %i[show edit update destroy]

  # GET /user_seasons or /user_seasons.json
  def index
    @user_seasons = UserSeason.all
  end

  # GET /user_seasons/1 or /user_seasons/1.json
  def show; end

  # GET /user_seasons/new
  def new
    @user_season = UserSeason.new
  end

  # GET /user_seasons/1/edit
  def edit; end

  # POST /user_seasons or /user_seasons.json
  def create
    @user_season = UserSeason.new(user_season_params)

    respond_to do |format|
      if @user_season.save
        format.html { redirect_to user_season_url(@user_season), notice: 'User season was successfully created.' }
        format.json { render :show, status: :created, location: @user_season }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_seasons/1 or /user_seasons/1.json
  def update
    respond_to do |format|
      if @user_season.update(user_season_params)
        format.html { redirect_to user_season_url(@user_season), notice: 'User season was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_seasons/1 or /user_seasons/1.json
  def destroy
    @user_season.destroy

    respond_to do |format|
      format.html { redirect_to user_seasons_url, notice: 'User season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_season
    @user_season = UserSeason.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_season_params
    params.require(:user_season).permit(:users_id, :seasons_id)
  end
end
