class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :neo_reference_id, :user_id, :asteroid

  def asteroid
    response = Faraday.get("https://api.nasa.gov/neo/rest/v1/neo/#{object.neo_reference_id}?api_key=#{ENV['NASA_API_KEY']}")
    parse_json = JSON.parse(response.body, symbolize_names: true)
    {name: parse_json[:name], is_potentially_hazardous_asteroid: parse_json[:is_potentially_hazardous_asteroid]}
  end
end
