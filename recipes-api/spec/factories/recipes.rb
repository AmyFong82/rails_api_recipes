FactoryBot.define do
  factory :recipe do
    # Because the name is a camel case string with no space,
    # I can only use Faker::Lorem.word for testing data.
    name { Faker::Lorem.unique.word }
    ingredients { [Faker::Food.ingredient, Faker::Food.ingredient] }
    instructions { Faker::Lorem.sentences }
  end
end