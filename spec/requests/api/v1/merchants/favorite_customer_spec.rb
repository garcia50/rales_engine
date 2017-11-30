require 'rails_helper'

RSpec.describe "Merchant favorite customer API", type: :response do
  describe 'GET /api/v1/merchants/:id/favorite_customer' do
    it "returns a favorite customer for a merchant based on successful transactions" do
      merchant = double()
      customer = double()

      allow(Merchant).to receive()

    end
  end
end


describe "get /api/v1/merchants/:id/revenue" do
  it "calls revenue on the merchant specified in the params and returns revenue as json" do
    
    # merchant = double()
  end
end

