class AddPwExpireToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pw_expire, :datetime
  end
end
