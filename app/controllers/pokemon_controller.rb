class PokemonController < ApplicationController
    before_action :set_pokemon, only: [:show, :update, :destroy]

    # GET /pokemonall
    def pokemonAll
        @pokemons = Pokemon.all
        json_response(@pokemons)
    end

    # GET /pokemon
    def index
       # get paginated current user todos
       @pokemons = Pokemon.paginate(page: params[:page], per_page: 20)
       json_response(@pokemons)
    end

    # POST /pokemon
    def create
        @pokemon = Pokemon.create!(pokemon_params)
        json_response(@pokemon, :created)
    end

    # GET /pokemon/:pokemonNb
    def show
        json_response(@pokemon)
    end

    # PUT /pokemon/:pokemonNb
    def update
        @pokemon.update(pokemon_params)
        head :no_content
    end

    # DELETE /pokemon/:id
    def destroy
        @pokemon.destroy
        head :no_content
    end

    private

    def pokemon_params
        # whitelist params
        params.permit(:pokemonNb, :name, :type1, :type2, :total, :hp, :attack, :defense, :spAtk, :spDef, :speed, :generation, :legendary)
    end

    def set_pokemon
        @pokemon = Pokemon.find(params[:id])
    end
end
