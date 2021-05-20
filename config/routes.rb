Rails.application.routes.draw do
  resources :pokemon
  get '/pokemonall' => 'pokemon#pokemonAll'
end
