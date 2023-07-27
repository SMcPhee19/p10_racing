class ChangeFinishPosition < ActiveRecord::Migration[7.0]
  def change
    rename_column :user_picks, :finish_position, :tenth_finish_position
  end
end
