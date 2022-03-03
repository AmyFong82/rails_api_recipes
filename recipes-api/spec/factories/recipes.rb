FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    ingredients { [Faker::Food.ingredient, Faker::Food.ingredient] }
    instructions { Faker::Lorem.sentences }
  end
end