require 'rails_helper'

RSpec.describe "Random customer", type: :request do
  describe "GET /api/v1/customers/random" do
    it "returns a customer resources" do
      create_list(:customer, 10)

      get '/api/v1/customers/random'

      expect(response).to be_success

      customer = JSON.parse(response.body)
      expect(customer["first_name"].class).to eq(String)
    end
  end
end
