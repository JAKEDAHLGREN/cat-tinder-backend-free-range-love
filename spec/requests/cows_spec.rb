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
        image: "onlycows.com"
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
        image: "cowsonly.com"
        }
      }
      post "/cows", params: cow_params
      expect(response).to have_http_status(200)

      cow = Cow.first
      expect(cow.name).to eq "Ferdinand"
      expect(cow.age).to eq 13
      expect(cow.enjoys).to eq 'chasing butterflies'
      expect(cow.color).to eq 'black'
      expect(cow.species).to eq 'angus'
      expect(cow.image).to eq 'cowsonly.com'
    end
  end

  describe "Cannot create a cow without valid attributes" do
    it 'cannot create a cow without a valid name' do
      cow_params = {
        cow: { 
          age: 14,
          enjoys: "sleeping",
          color: "white",
          species: "limousin",
          image: "cowsonly.com",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      puts "****** ", response.body
      
      expect(response).to have_http_status(422)
      expect(cow['name']).to include "can't be blank"
    end

    it 'cannot create a cow without a valid age' do
      cow_params = {
        cow: { 
          name: "Clarabelle",
          enjoys: "sleeping",
          color: "white",
          species: "limousin",
          image: "cowsonly.com",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['age']).to include "can't be blank"
    end

    it 'cannot create a cow without a valid enjoys' do
      cow_params = {
        cow: {   
          name: "Clarabelle",
          age: 14,
          color: "white",
          species: "limousin",
          image: "cowsonly.com",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['enjoys']).to include "can't be blank"
    end
    it 'cannot create a cow without a valid color' do
      cow_params = {
        cow: {
          name: "Clarabelle",
          age: 14,
          enjoys: "white",
          species: "limousin",
          image: "cowsonly.com",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['color']).to include "can't be blank"
    end
    it 'cannot create a cow without a valid species' do
      cow_params = {
        cow: {
          name: "Clarabelle",
          age: 14,
          enjoys: "sleeping",
          color: "white",
          image: "cowsonly.com",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['species']).to include "can't be blank"
    end
    it 'cannot create a cow without a valid image' do
      cow_params = {
        cow: {
          name: "Clarabelle",
          age: 14,
          enjoys: "sleeping",
          color: "white",
          species: "limousin",
        }
      }
      post '/cows', params: cow_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(json['image']).to include "can't be blank"
    end
  end
  describe 'cannot update a cow without valid attributes' do
    it 'cannot update a cow without a valid name' do
      cow_params = {
        cow: {
          name: "Clarabelle",
          age: 14,
          enjoys: "sleeping",
          color: "white",
          species: "limousin",
          image: "cowsonly.com"
        } 
      }
      post '/cows', params: cow_params
      cow = Cow.first
      update_params = {
        cow: {
          name: "",
          age: 14,
          enjoys: "sleeping",
          color: "white",
          species: "limousin",
        }
      }
      patch "/cows/#{cow.id}", params: update_params
      cow = JSON.parse(response.body)
      expect(response).to have_http_status(422)
      expect(cow['name']).to include "can't be blank"
    end
  end
end



