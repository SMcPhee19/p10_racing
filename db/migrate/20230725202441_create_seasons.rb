# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.string :season_year

      t.timestamps
    end
  end
end
