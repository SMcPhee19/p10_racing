# frozen_string_literal: true

json.extract! user_pick, :id, :users_id, :driver_id, :circuit_id, :points_earned, :created_at, :updated_at
json.url user_pick_url(user_pick, format: :json)
