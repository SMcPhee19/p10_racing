# frozen_string_literal: true

class AddDnfFinishPositionToUserPicks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :dnf_finish_position, :string
  end
end
