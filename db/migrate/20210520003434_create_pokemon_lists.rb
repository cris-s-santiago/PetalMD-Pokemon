class CreatePokemonLists < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemon_lists do |t|
      t.integer :pokemonNb
      t.string :name
      t.string :type1
      t.string :type2
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :spAtk
      t.integer :spDef
      t.integer :speed
      t.integer :generation
      t.string :legendary

      t.timestamps
    end
  end
end
