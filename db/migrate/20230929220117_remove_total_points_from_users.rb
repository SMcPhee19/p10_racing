# frozen_string_literal: true

class RemoveTotalPointsFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :total_points, :integer
  end
end
