# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

# Data transfer from csv file to sqlite3
CSV.foreach(Rails.root.join('db', 'pokemon.csv'), headers: true) do |row|
    Pokemon.create!(
      pokemonNb: row['#'],
      name: row['Name'], 
      type1: row['Type 1'],
      type2: row['Type 2'],
      total: row['Total'],
      hp: row['HP'], 
      attack: row['Attack'],
      defense: row['Defense'],
      spAtk: row['Sp. Atk'],
      spDef: row['Sp. Def'], 
      speed: row['Speed'],
      generation: row['Generation'],
      legendary: row['Legendary']
    )
end