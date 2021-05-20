require 'rails_helper'

RSpec.describe "Pokemons", type: :request do
  # initialize test data
  let!(:pokemon) { create_list(:pokemon, 10) }

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
end
