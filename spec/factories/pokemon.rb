FactoryBot.define do
    factory :pokemon do
      pokemonNb { Faker::Number.number(3) }
      name { Faker::Games::Pokemon.name }
      type1 { [:Grass, :Fire, :Water, :Normal].sample }
      type2 { [:Poison, :Flying, :Dragon, :Fairy].sample }
      total { Faker::Number.number(3) }
      hp { Faker::Number.number(3) }
      attack { Faker::Number.number(3) }
      defense { Faker::Number.number(3) }
      spAtk { Faker::Number.number(3) }
      spDef { Faker::Number.number(3) }
      speed { Faker::Number.number(3) }
      generation { Faker::Number.between(from: 1, to: 6) }
      legendary { Faker::Boolean.boolean }
    end
end