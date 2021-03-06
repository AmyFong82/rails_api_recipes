require 'rails_helper'

RSpec.describe "Recipes API", type: :request do
  # initialize test data
  let!(:recipes) { create_list(:recipe, 10)}
  let(:recipe_id) {recipes.first.id}

  #Test suite for GET /todos
  describe "GET /recipes" do
    # make HTTP get request before each example
    before { get '/recipes' }

    it 'returns an object with key: "recipeNames" in an Array' do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json).to include("recipeNames")
      expect(json.first).to be_an(Array)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /recipes/details/:name
  describe 'GET /recipes/details/:name' do
    before { get "/recipes/details/#{recipes.first.name}" }

    context 'when the record exists' do
      it 'returns the recipe' do
        expect(json).not_to be_empty
        expect(json['details']['ingredients']).to eq(recipes.first.ingredients)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      before { get "/recipes/details/nothing" }

      it 'returns an empty Json {}' do
        expect(json).to eq({})
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for POST /recipes
  describe 'POST /recipes' do
    # valid payload
    let(:valid_attributes) {
      { recipe:{
          name: "butteredBagel", 
          ingredients: ["1 bagel", "butter"],
          instructions: ["cut the bagel", "spread butter on bagel"]
        }
      }
    }

    context 'when the request is valid' do
      before { post '/recipes', params: valid_attributes}

      it 'returns an empty Response body' do
        expect(response.body).to be_empty
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the recipe already exists' do
      before { post '/recipes', params: valid_attributes}
      before { post '/recipes', params: valid_attributes}

      it 'returns error message in response body' do
        expect(response.body)
          .to match(/Recipe already exists/)
      end

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end
    end

  end

  # Test suite for PUT /recipes
  describe 'PUT /recipes' do
    let(:valid_attributes) {
      { recipe:{
          name: "butteredBagel", 
          ingredients: ["1 bagel", "butter"],
          instructions: ["cut the bagel", "spread butter on bagel"]
        }
      }
    }

    let(:invalid_attributes){
      { recipe:{
          name: "butteredBagelBB", 
          ingredients: ["2 bagel", "butter"],
          instructions: ["cut the bagel", "spread butter on bagel"]
        }
      }
    }

    context 'when the record exists' do
      before { post "/recipes", params: valid_attributes }
      before { put "/recipes", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end

    context 'when the record does not exist' do
      before { put "/recipes", params: invalid_attributes }

      it 'returns error message' do
        expect(response.body).to match(/Recipe does not exist/)
      end

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end

  end

end
