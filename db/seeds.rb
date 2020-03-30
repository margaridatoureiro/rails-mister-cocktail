require 'json'
require 'open-uri'
require 'faker'

puts 'Destroying poisonous condiments'
Ingredient.destroy_all

list = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)

list['drinks'].each do |elem|
  Ingredient.create!(name: elem['strIngredient1'])
end

puts 'Destroying poisonous beverages'
Dose.destroy_all
10.times do
  Cocktail.create(name: Faker::FunnyName.name)
end

puts 'Fancy booze selection have just been brewed🍹'
