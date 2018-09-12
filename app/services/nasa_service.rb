class NasaService
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def asteroids
    JSON.parse(response.body, symbolize_names: true)[:near_earth_objects][:"2018-09-11"]
  end

  private
  attr_reader :start_date,
              :end_date

  def response
    conn.get("/neo/rest/v1/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{ENV['NASA_API_KEY']}")
  end

  def conn
    Faraday.new(url: "https://api.nasa.gov") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
