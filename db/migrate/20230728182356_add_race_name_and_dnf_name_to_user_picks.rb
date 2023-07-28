class AddRaceNameAndDnfNameToUserPicks < ActiveRecord::Migration[7.0]
  def change
    add_column :user_picks, :race_name, :string
    add_column :user_picks, :dnf_name, :string
  end
end
