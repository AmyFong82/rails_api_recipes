FactoryBot.define do
  factory :recipe do
    name { Faker::Lorem.unique.word }
    ingredients { [Faker::Food.ingredient, Faker::Food.ingredient] }
    instructions { Faker::Lorem.sentences }
  end
end