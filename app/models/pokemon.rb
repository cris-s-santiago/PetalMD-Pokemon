class Pokemon < ApplicationRecord
    # validations
    validates_presence_of :pokemonNb, :name, :type1, :total, :hp, :attack, :defense, :spAtk, :spDef, :speed, :generation, :legendary
end
