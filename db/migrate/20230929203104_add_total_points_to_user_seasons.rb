# frozen_string_literal: true

class AddTotalPointsToUserSeasons < ActiveRecord::Migration[7.0]
  def change
    add_column :user_seasons, :total_points, :integer, default: 0
  end
end
