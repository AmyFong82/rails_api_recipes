class Recipe < ApplicationRecord
  serialize :ingredients, Array
  serialize :instructions, Array
end
