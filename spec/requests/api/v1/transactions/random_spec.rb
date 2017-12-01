require 'rails_helper'

RSpec.describe "Random transaction", type: :request do
  describe "GET /api/v1/transactions/random" do
    it "returns a random resources" do
      create_list(:transaction, 10)

      get '/api/v1/transactions/random'

      expect(response).to be_success

      transaction = JSON.parse(response.body)
      expect(transaction["result"].class).to eq(String)
    end
  end
end
