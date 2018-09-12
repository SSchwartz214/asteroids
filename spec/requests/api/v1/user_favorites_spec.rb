require 'rails_helper'

describe 'User favorites API' do
  it 'sends a list of user favorites' do
    uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
    api_key = uncle_jesse.create_api_key(value: "abc123")
    uncle_jesse.favorites.create(neo_reference_id: "2153306")

    get "/api/v1/user/favorites?api_key=#{api_key.value}"

    expect(response).to be_successful
    favorite = JSON.parse(response.body, symbolize_names: true)

    return_json =  [{
    "id":1,
    "neo_reference_id": "2153306",
    "user_id": 1,
    "asteroid": {
      "name": "153306 (2001 JL1)",
      "is_potentially_hazardous_asteroid": false,
    }
  }]

    expect(favorite).to eq(return_json)
  end

    it 'user creates favorites' do
      uncle_jesse = User.create(name: "Jesse Katsopolis", email: "uncle.jesse@example.com")
      api_key = uncle_jesse.create_api_key(value: "abc123")
      uncle_jesse.favorites.create(neo_reference_id: "2153306")
      require "pry"; binding.pry


      post "/api/v1/user/favorites?api_key=abc123&neo_reference_id=2021277"

      #shit happens here ie: get request to external API and send them back return json
      return_json =  {
        "id":2,
        "neo_reference_id": "2021277",
        "user_id": 1,
        "asteroid": {
          "name": "21277 (1996 TO5)",
          "is_potentially_hazardous_asteroid": false,
        }
      }

      expect(response).to be_successful

      favorite = JSON.parse(response.body, symbolize_names: true)

      expect(favorite).to eq(return_json)
      expect(user.favorites.count).to eq(1)
      expect(user.favorites.last.id).to eq(2)
    end
end
