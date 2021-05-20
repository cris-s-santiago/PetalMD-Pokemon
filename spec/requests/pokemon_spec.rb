require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  # initialize test data
  let!(:pokemon) { create_list(:pokemon, 10) }
  let!(:id) { pokemon.first.id }

  # Test suite for GET /pokemon
  describe 'GET /pokemon' do
    # make HTTP get request before each example
    before { get '/pokemon' }

    it 'returns pokemon' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /pokemon/:pokemonNb
  describe 'GET /pokemon/:id' do
    before { get "/pokemon/#{id}" }

    context 'when the record exists' do
      it 'returns the pokemon' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:id) { 900 }
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Pokemon/)
      end
    end
  end

  # Test suite for POST /pokemon
  describe 'POST /pokemon' do
    # valid payload
    let(:valid_attributes) { { pokemonNb: "1" , name: "PetalMD", type1: "Grass", total: "318", hp: "45", attack: "49", defense: "49", spAtk: "65", spDef: "65", speed: "45", generation: "1", legendary: "False" } }

    context 'when the request is valid' do
      before { post '/pokemon', params: valid_attributes }

      it 'creates a pokemon' do
        expect(json['name']).to eq('PetalMD')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pokemon', params: { pokemonNb: "1", type1: "Grass", total: "318", hp: "45", attack: "49", defense: "49", spAtk: "65", spDef: "65", speed: "45", generation: "1", legendary: "False" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  # Test suite for PUT /pokemon/:id
  describe 'PUT /pokemon/:id' do
    let(:valid_attributes) { { pokemonNb: "1" , name: "PetalMD", type1: "Grass", total: "318", hp: "45", attack: "49", defense: "49", spAtk: "65", spDef: "65", speed: "45", generation: "1", legendary: "False" } }

    context 'when the record exists' do
      before { put "/pokemon/#{id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /pokemon/:id
  describe 'DELETE /pokemon/:id' do
    before { delete "/pokemon/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
  
end
