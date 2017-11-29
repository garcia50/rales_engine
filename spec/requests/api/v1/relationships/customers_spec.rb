require 'rails_helper'

RSpec.describe "Customer Relationships API", type: :request do
  let!(:customer)     { create(:customer) }
  let!(:merchant)     { create(:merchant) }
  let!(:customer_id)  { customer.id }
  let!(:cool_invoice) { customer.invoices.create!(status: 'cool', merchant: merchant, customer: customer) }
  let!(:meh_invoice)  { customer.invoices.create!(status: 'meh',  merchant: merchant, customer: customer) }

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

  describe "GET /api/v1/customers/:id/transactions" do
    context "when customer exists" do
      before do
        customer = create(:customer)
        invoice  = create(:invoice, customer: customer)
        invoice.transactions << create_list(:transaction, 5)

        get "/api/v1/customers/#{customer.id}/transactions"
      end

      it 'returns all of the customers transactions' do
        expect(json).to_not be_empty
        expect(json.length).to eq(5)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when customer does not exist" do
      before { get "/api/v1/customers/#{3303}/transactions" }

      it "returns http status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Customer/)
      end
    end
  end
end