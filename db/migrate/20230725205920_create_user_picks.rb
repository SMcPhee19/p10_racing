# frozen_string_literal: true

class CreateUserPicks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_picks do |t|
      t.references :user, foreign_key: true
      t.string :driver_id
      t.string :circuit_id
      t.integer :points_earned

      t.timestamps
    end
  end
end
