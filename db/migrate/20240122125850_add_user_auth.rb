# frozen_string_literal: true

class AddUserAuth < ActiveRecord::Migration[7.0]
  # Create table to hold a list of possible user claims
  def change
    create_table :userclaims do |t|
      t.string :name
      t.timestamps
    end

    # Create claim to link users with claims
    create_table :users_x_userclaims do |t|
      t.references :user, foreign_key: true
      t.references :userclaim, foreign_key: true
      t.timestamps
    end

    # Add pw columns to users table
    add_column :users, :pw_hash, :string
    add_column :users, :pw_salt, :string
    add_column :users, :username, :string, unique: true
  end
end