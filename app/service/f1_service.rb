class F1Service
  def get_drivers(season)
    Rails.cache.fetch([season], expires: 1.week) do
      get_url("/api/f1/#{season}/drivers.json")
    end
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