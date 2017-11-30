require 'rails_helper'

RSpec.describe "Merchant favorite customer API", type: :request do
  describe 'GET /api/v1/merchants/:id/favorite_customer' do
    it "returns a favorite customer for a merchant" do
      merchant = double()
      customer = create(:customer)

      allow(Merchant).to receive(:find).with("1") { merchant }
      expect(merchant).to receive(:favorite_customer).once { customer }

      get "/api/v1/merchants/1/favorite_customer"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(customer.id)
    end
  end
end