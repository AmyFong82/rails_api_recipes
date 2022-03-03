require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # Validation tests
  # ensure name, ingredients and instructions are present before saving
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:ingredients)}
  it { should validate_presence_of(:instructions)}
  it { should validate_uniqueness_of(:name)}
end
