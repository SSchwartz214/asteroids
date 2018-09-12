class MostDangerousDayPresenter
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def asteroids
    service.asteroids.map do |asteroid_data|
      Asteroid.new(asteroid_data)
    end
  end

  private
  attr_reader :start_date,
              :end_date

  def service
    NasaService.new(start_date, end_date)
  end
end
