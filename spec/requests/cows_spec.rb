require 'rails_helper'

RSpec.describe "Cows", type: :request do
  describe "GET /index" do
    it "gets a list of cows" do
      Cow.create(
        name: "Ferdinand",
        age: 13,
        enjoys: "chasing butterflies",
        color: "black",
        species: "angus",
        image: "https://pixabay.com/photos/bull-field-beefmaster-summer-sunny-5866514/"
      )
      get '/cows'

      cow = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cow.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a cow" do
      cow_params = {
        cow: {
        name: "Ferdinand",
        age: 13,
        enjoys: "chasing butterflies",
        color: "black",
        species: "angus",
        image: "https://pixabay.com/photos/bull-field-beefmaster-summer-sunny-5866514/"
        }
      }
      post '/cows', params: cow_params
      expect(response).to have_http_status(200)

      cow = Cow.first
      expect(cow.name).to eq "Ferdinand"
    end
  end
  
end

