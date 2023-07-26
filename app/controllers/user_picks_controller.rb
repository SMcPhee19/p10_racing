# frozen_string_literal: true

class UserPicksController < ApplicationController
  before_action :set_user_pick, only: %i[show edit update destroy]

  # GET /user_picks or /user_picks.json
  def index
    @user_picks = UserPick.all
  end

  # GET /user_picks/1 or /user_picks/1.json
  def show; end

  # GET /user_picks/new
  def new
    @user_pick = UserPick.new
  end

  # GET /user_picks/1/edit
  def edit; end

  # POST /user_picks or /user_picks.json
  def create
    @user_pick = UserPick.new(user_pick_params)

    respond_to do |format|
      if @user_pick.save
        format.html { redirect_to user_pick_url(@user_pick), notice: 'User pick was successfully created.' }
        format.json { render :show, status: :created, location: @user_pick }
      else
        format.html { render :new, status: :unprocessable_entity }
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

  # Only allow a list of trusted parameters through.
  def user_pick_params
    params.require(:user_pick).permit(:users_id, :driver_id, :circuit_id, :points_earned)
  end
end