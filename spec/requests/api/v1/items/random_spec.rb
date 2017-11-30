require 'rails_helper'

RSpec.describe "Random item", type: :request do
  describe "GET /api/v1/items/random" do
    it "returns a random item" do
      create_list(:item, 100)

      get '/api/v1/items/random'

      expect(json).to_not be_empty
      expect(json["id"].class).to eq(Integer)
      expect(json["name"].class).to eq(String)
      expect(json["description"].class).to eq(String)
      expect(json["unit_price"].class).to eq(Integer)
    end
  end
end