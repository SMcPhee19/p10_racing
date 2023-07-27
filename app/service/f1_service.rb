# frozen_string_literal: true

class F1Service
  def get_drivers(driver_season)
    Rails.cache.fetch([driver_season], expires: 1.week) do
      get_url("/api/f1/#{driver_season}/drivers.json")
    end
  end

  def get_result(race_season, round)
    Rails.cache.fetch([race_season, round], expires: 1.week) do
      get_url("/api/f1/#{race_season}/#{round}/results.json")
    end
  end

  def get_constructors(constructors_season)
    # Rails.cache.fetch([constructors_season], expires: 1.week) do
    get_url("/api/f1/#{constructors_season}/constructors.json")
    # end
  end

  def get_schedule(season)
    get_url("/api/f1/#{season}.json")
  end

  def get_driver_standings(season)
    get_url("/api/f1/#{season}/driverStandings.json")
  end

  def get_constructor_standings(season)
    get_url("/api/f1/#{season}/constructorStandings.json")
  end

  def get_latest_race
    get_url('/api/f1/current/last/results.json')
  end

  def get_qualifying(season, round)
    get_url("/api/f1/#{season}/#{round}/qualifying.json")
  end

  private

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'http://ergast.com')
  end
end
