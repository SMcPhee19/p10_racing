# frozen_string_literal: true

class AddSeasonIdToUserPicks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :season_id, :integer
  end
end
