require 'rails_helper'

RSpec.describe "Random invoice", type: :request do
  describe "GET /api/v1/invoices/random" do
    it "returns a random invoice" do
      create_list(:invoice, 100)

      get '/api/v1/invoices/random'

      expect(json).to_not be_empty
      expect(json["id"].class).to eq(Integer)
      expect(json["status"].class).to eq(String)
    end
  end
end