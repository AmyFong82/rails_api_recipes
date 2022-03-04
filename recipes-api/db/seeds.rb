require 'json'

if Recipe.count == 0
  path = File.join(File.dirname(__FILE__), './data.json')
  recipes = JSON.parse(File.read(path))
  recipes["recipes"].each do |record|
    Recipe.create!(record)
  end
  puts 'recipes are seeded'
end