# frozen_string_literal: true

json.extract! user_season, :id, :users_id, :seasons_id, :created_at, :updated_at
json.url user_season_url(user_season, format: :json)
