require 'rails_helper'

describe 'User favprites API' do
  it 'sends a list of user favorites' do
    user = create(:user, email: "uncle.jesse@example.com", name: "Jesse Katsopolis")

    get '/api/v1/user/favorites?api_key=abc123'

    expect(response).to be_successful

    favorite = JSON.parse(response.body)

    expect favorite(["id"]).to eq 1
  end
end
