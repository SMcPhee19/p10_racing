# frozen_string_literal: true

class UserPicksController < ApplicationController # rubocop:disable Style/Documentation
  before_action :set_user_pick, only: %i[show edit update destroy]

  # GET /user_picks or /user_picks.json
  def index
    @sort_column = params[:sort] || 'user_id'
    @sort_direction = params[:direction] || 'asc'
    @season = Season.find(params[:season_id])
    @position = 1
    allowed_columns = %w[user_id driver_id circuit_id points_earned created_at tenth_finish_position
                         driver_id_dnf driver_id_tenth dnf_finish_position race_name dnf_name]
    @sort_column = allowed_columns.include?(@sort_column) ? @sort_column : 'user_id'
    @user_picks = UserPick.where(season_id: @season.id).includes(:user).order("#{@sort_column} #{@sort_direction}")
    @last_6 = UserPick.last(15) # rubocop:disable Naming/VariableNumber
  end

  # GET /user_picks/1 or /user_picks/1.json
  def show
    @season = Season.find_by_id(@user_pick.season_id)
  end

  # GET /user_picks/new
  def new
    @season = Season.find(params[:season_id])
    @user_pick = UserPick.new
  end

  # GET /user_picks/1/edit
  def edit; end

  # POST /user_picks or /user_picks.json
  def create # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    @user_pick = UserPick.new(user_pick_params)
    respond_to do |format|
      if @user_pick.save
        format.html { redirect_to user_pick_url(@user_pick), notice: 'User pick was successfully created.' }
        format.json { render :show, status: :created, location: @user_pick }
      else
        flash[:error] = @user_pick.errors.full_messages.to_sentence
        format.html { redirect_to "/users/#{user_pick_params[:user_id]}", status: :unprocessable_entity }
        format.json { render json: @user_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_picks/1 or /user_picks/1.json
  def update
    respond_to do |format|
      if @user_pick.update(user_pick_params)
        format.html { redirect_to user_pick_url(@user_pick), notice: 'User pick was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_pick }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_pick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_picks/1 or /user_picks/1.json
  def destroy
    @user_pick.destroy

    respond_to do |format|
      format.html { redirect_to user_picks_url, notice: 'User pick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_pick
    @user_pick = UserPick.find(params[:id])
  end

  def user_pick_params
    params.require(:user_pick).permit(:user_id, :driver_id_tenth, :driver_id_dnf, :circuit_id, :season_id)
  end
end
