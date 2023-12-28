# frozen_string_literal: true

class SeasonsController < ApplicationController
  before_action :set_season, only: %i[show edit update destroy]

  # GET /seasons or /seasons.json
  def index
    @seasons = Season.all
  end

  # GET /seasons/1 or /seasons/1.json
  def show
    @driver_standings = F1Facade.new.get_driver_standings(@season.season_year)
    @constructor_standings = F1Facade.new.get_constructor_standings(@season.season_year)
    @users = User.all
    # @user = User.find(params[:user_id])
    @next_race = @season.next_race_weekend(@season.season_year)
    @last_race = @season.last_race_weekend
    @drivers_position = 1
    @constructors_position = 1
  end

  # GET /seasons/new
  def new
    @hide_header = true
    @season = Season.new
  end

  # GET /seasons/1/edit
  def edit; end

  # POST /seasons or /seasons.json

  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.season_year.present?
        @season.save
        User.all.each do |user|
          UserSeason.create!(user_id: user.id, season_id: @season.id)
        end
        format.html { redirect_to season_url(@season), notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new, status: :unprocessable_entity, notice: 'Season year cannot be empty.' }
        format.json { render json: { error: 'Season year cannot be empty.' }, status: :unprocessable_entity }
      end
    end
  end

  ## How we had it before
  # def create
  #   @season = Season.new(season_params)

  #   respond_to do |format|
  #     unless @season.season_year.empty?
  #       if @season.save
  #         User.all.each do |user|
  #           UserSeason.create!(user_id: user.id, season_id: @season.id)
  #         end
  #         format.html { redirect_to season_url(@season), notice: 'Season was successfully created.' }
  #         format.json { render :show, status: :created, location: @season }
  #       else
  #         format.html { render :new, status: :unprocessable_entity }
  #         format.json { render json: @season.errors, status: :unprocessable_entity }
  #       end
  #     end
  #   end
  # end

  ## First fix for failing test on line 38 of seasons_controller_spec
  # def create
  #   @season = Season.new(season_params)

  #   respond_to do |format|
  #     if @season.season_year.present?
  #       if @season.save
  #         User.all.each do |user|
  #           UserSeason.create!(user_id: user.id, season_id: @season.id)
  #         end
  #         format.html { redirect_to season_url(@season), notice: 'Season was successfully created.' }
  #         format.json { render :show, status: :created, location: @season }
  #       else
  #         format.html { render :new, status: :unprocessable_entity }
  #         format.json { render json: @season.errors, status: :unprocessable_entity }
  #       end
  #     else
  #       format.html { render :new, status: :unprocessable_entity, notice: 'Season year cannot be empty.' }
  #       format.json { render json: { error: 'Season year cannot be empty.' }, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /seasons/1 or /seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to season_url(@season), notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1 or /seasons/1.json
  def destroy
    @season.destroy

    respond_to do |format|
      format.html { redirect_to seasons_url, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_season
    @season = Season.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def season_params
    params.require(:season).permit(:season_year, :id, :user_id)
  end
end
