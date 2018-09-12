class Asteroid
  attr_reader :name,
              :id

  def initialize(data)
    @name = data[:name]
    @id = data[:neo_reference_id]
  end
end
