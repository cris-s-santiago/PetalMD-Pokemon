class PokemonController < ApplicationController
    before_action :set_pokemon, only: [:show, :update, :destroy]

    # GET /pokemonall
    def pokemonAll
        # returns a list of all Pokémon
        @pokemons = Pokemon.all
        json_response(@pokemons)
    end

    # GET /pokemon
    def index
       # get paginated Pokémon
       @pokemons = Pokemon.paginate(page: params[:page], per_page: 20)
       json_response(@pokemons)
    end

    # POST /pokemon
    def create
        # creates a new Pokémon with the allowed parameters.
        @pokemon = Pokemon.create!(pokemon_params)
        json_response(@pokemon, :created)
    end

    # GET /pokemon/:id
    def show
        # use the @pokemon found from the set_pokemon
        json_response(@pokemon)
    end

    # PUT /pokemon/:id
    def update
        # use the @pokemon found from the set_pokemon
        @pokemon.update(pokemon_params)
        head :no_content
    end

    # DELETE /pokemon/:id
    def destroy
        # use the @pokemon found from the set_pokemon
        @pokemon.destroy
        head :no_content
    end

    def pokemon_params
        # params allowed
        params.permit(:pokemonNb, :name, :type1, :type2, :total, :hp, :attack, :defense, :spAtk, :spDef, :speed, :generation, :legendary)
    end

    def set_pokemon
        # find the Pokémon through the id
        @pokemon = Pokemon.find(params[:id])
    end
end
