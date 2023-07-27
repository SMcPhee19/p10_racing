# frozen_string_literal: true

class FixDriverIdName < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :driver_id_tenth, :string, default: ''
  end
end
