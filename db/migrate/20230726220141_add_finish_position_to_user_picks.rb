class AddFinishPositionToUserPicks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :finish_position, :integer, default: nil
  end
end
