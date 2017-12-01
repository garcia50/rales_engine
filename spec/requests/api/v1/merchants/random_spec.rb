require 'rails_helper'

RSpec.describe "Random merchant", type: :request do
  describe "GET /api/v1/merchants/random" do
    it "returns a random resources" do
      create_list(:merchant, 10)

      get '/api/v1/merchants/random'

      expect(response).to be_success

      merchant = JSON.parse(response.body)
      expect(merchant.count).to eq(1)
    end
  end
end
