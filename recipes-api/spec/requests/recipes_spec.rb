require 'rails_helper'

RSpec.describe "Recipes API", type: :request do
  # initialize test data
  let!(:recipes) { create_list(:recipe, 10)}
  let(:recipe_id) {recipes.first.id}

  #Test suite for GET /todos
  describe "GET /recipes" do
    # make HTTP get request before each example
    before { get '/recipes' }

    it 'returns recipes' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /recipes/details/:name
  describe 'GET /recipes/details/:name' do
    before { get "/recipes/details/#{name}" }

    context 'when the record exists' do
      it 'returns the recipe' do
        expect(json).not_to be_empty
        expect(json['name']).to eq(name)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:name) {"I Don't Know"}

      it 'returns an empty Json {}' do
        expect(response).to eq({})

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /recipes
  describe 'POST /recipes' do
    # valid payload
    let(:valid_attributes) {
      { name: "butteredBagel", 
        ingredients: ["1 bagel", "butter"],
        instructions: ["cut the bagel", "spread butter on bagel"]
      }
    }

end
