require 'rails_helper'

RSpec.describe "Customers with pending invoices API", type: :request do
  describe "GET /api/v1/merchants/:id/customer_with_pending_invoices" do
    it 'returns customers with pending invoices' do
      merchant = double()
      customers = create_list(:customer, 5)

      allow(Merchant).to receive(:find).with("1") { merchant }
      expect(merchant).to receive(:customers_with_pending_invoices).once { customers }

      get "/api/v1/merchants/1/customers_with_pending_invoices"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(5)
    end
  end
end