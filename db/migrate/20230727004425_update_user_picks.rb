# frozen_string_literal: true

class UpdateUserPicks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :driver_id_dnf, :string
  end
end
