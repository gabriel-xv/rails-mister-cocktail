require 'json'
require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ing_serialized = open(url).read
ingredients = JSON.parse(ing_serialized)

puts 'Creating ingredients'

ingredients['drinks'].each do |ingredient_pair|
  Ingredient.create(name: ingredient_pair['strIngredient1'])
end

puts 'Finished'
