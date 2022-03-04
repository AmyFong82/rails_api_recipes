class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructions, :ingredients
end
