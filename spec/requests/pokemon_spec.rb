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
  
end
