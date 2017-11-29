require 'rails_helper'

RSpec.describe "Customer Relationships API", type: :request do
  let!(:customer)     { create(:customer) }
  let!(:merchant)     { create(:merchant) }
  let!(:customer_id)  { customer.id }
  let!(:cool_invoice) { customer.invoices.create!(status: 'cool', merchant: merchant) }
  let!(:meh_invoice)  { customer.invoices.create!(status: 'meh',  merchant: merchant) }

  describe 'GET /api/v1/customers/:id/invoices' do
    before { get "/api/v1/customers/#{customer_id}/invoices"}

    context "when the customer exists" do
      it "returns all of the customers invoices" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["status"]).to eq(cool_invoice.status)
      end

      it "returns http status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when resource does not exist" do
      let!(:customer_id) { 22 }

      it 'returns http status code 404' do
        expect(response).to have_http_status(404)
      end

      it "returns error message" do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end
end

#<Invoice id: nil, status: nil, created_at: nil, updated_at: nil, merchant_id: nil, customer_id: nil>


# GET /api/v1/customers/:id/invoices
# returns a collection oassociated invoices

# GET /api/v1/customers/:id/transactions
# returns a collection oassociated transactions
