# frozen_string_literal: true

json.extract! season, :id, :season_year, :created_at, :updated_at
json.url season_url(season, format: :json)
