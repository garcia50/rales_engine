require 'rails_helper'

RSpec.describe "Random invoice item", type: :request do
  describe "GET /api/v1/invoice_items/random" do
    it "returns a random invoice item" do
      create_list(:invoice_item, 100)

      get '/api/v1/invoice_items/random'

      expect(json).to_not be_empty
      expect(json["id"].class).to eq(Integer)
      expect(json["invoice_id"].class).to eq(Integer)
      expect(json["item_id"].class).to eq(Integer)
    end
  end
end