require 'rails_helper'

RSpec.describe "Invoice relationships API", type: :request do

  let!(:invoice)    { create(:invoice) }
  let!(:merchant)    { create(:merchant) }
  let!(:customer)    { create(:customer) }
  let!(:invoice_id) { invoice.id }
  let!(:item)    { create(:item) }
  let!(:transaction_1) { invoice.transactions.create!(result: "pending" )}
  let!(:transaction_2) { invoice.transactions.create!(result: "complete" )}
  let!(:item_1) { invoice.items.create!(name: "zoey", description: "a dog" )}
  let!(:item_2) { invoice.items.create!(name: "flower", description: "red")}
  let!(:invoice_items_1) { invoice.invoice_items.create!(quantity: 4, unit_price: 33, item: item) }
  let!(:invoice_items_2) { invoice.invoice_items.create!(quantity: 5, unit_price: 33, item: item )}

   it 'returns all of a associated transactions' do
     get "/api/v1/invoices/#{invoice_id}/transactions"
  
       expect(response).to be_success

       transactions = JSON.parse(response.body)
       expect(transactions.count).to eq(2)
       expect(json.first["result"]).to eq(transaction_1.first["result"])
  end

  describe "GET /api/v1/invoices/:id/invoice_items" do
    before {  get "/api/v1/invoices/#{invoice_id}/invoice_items" }

    context "when the invoice exists" do
      it "returns all of invoices items" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["name"]).to eq(items.name)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the invoice does not exist" do
      let!(:invoice_id) { 2323233 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  describe "GET /api/v1/invoices/:id/items" do
    before{ get "/api/v1/invoices/#{invoice_id}/items" }

    context "when the invoice exists" do
      it "returns all items" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["quantity"]).to eq(invoice_items.quantity)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the invoice does not exist" do
      let!(:invoice_id) { 2323233 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  describe "GET /api/v1/invoices/:id/items" do
    before { get "/api/v1/invoices/#{invoice_id}/items" }

    context "when the invoice exists" do
      it "returns all items" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["quantity"]).to eq(invoice_items.quantity)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the invoice does not exist" do
      let!(:invoice_id) { 2323233 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  describe "GET /api/v1/invoices/:id/customer" do
    before { get "/api/v1/invoices/#{invoice_id}/customer"}

    context "when invoice exists" do
      it "returns an associated customer" do
        expect(json).to_not be_empty
        expect(json["id"]).to eq(invoice.customer.id)
        expect(json["first_name"]).to eq(invoice.customer.first_name)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when invoice does not exist" do
      let!(:invoice_id) { 432 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns ultra robust error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end

  describe "GET /api/v1/invoices/:id/merchant" do
    before { get "/api/v1/invoices/#{invoice_id}/merchant"}

    context "when invoice exists" do
      it "returns an associated merchant" do
        expect(json).to_not be_empty
        expect(json["id"]).to eq(invoice.merchant.id)
        expect(json["name"]).to eq(invoice.merchant.name)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when invoice does not exist" do
      let!(:invoice_id) { 432 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns ultra robust error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end
end
