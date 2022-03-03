class Recipe < ApplicationRecord
  # turn the text to array format
  serialize :ingredients, Array
  serialize :instructions, Array

  # validations
  validates_presence_of :name, :ingredients, :instructions
end
