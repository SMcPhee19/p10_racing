# frozen_string_literal: true

class CreateUserSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :user_seasons do |t|
      t.references :user, foreign_key: true
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
