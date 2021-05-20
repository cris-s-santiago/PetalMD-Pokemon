class Pokemon < ApplicationRecord
    # checks whether the fields exist and are not blank.
    validates_presence_of :pokemonNb, :name, :type1, :total, :hp, :attack, :defense, :spAtk, :spDef, :speed, :generation, :legendary
end
