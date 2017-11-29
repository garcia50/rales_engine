require 'rails_helper'

RSpec.describe "Invoice relationships API", type: :request do

  let!(:invoice)    { create(:invoice) }
  let!(:merchant)    { create(:merchant) }
  let!(:customer)    { create(:customer) }
  let!(:invoice_id) { invoice.id }
  let!(:transaction_1) { invoice.transactions.create!(result: "pending" )}
  let!(:transaction_2) { invoice.transactions.create!(result: "complete" )}
  let!(:item_1) { Item.create!(name: "zoey", description: "a dog" , unit_price: 30, merchant_id: merchant.id)}
  let!(:item_2) { Item.create!(name: "flower", description: "red", unit_price: 50, merchant_id: merchant.id)}
  let!(:invoice_items_1) { invoice.invoice_items.create!(quantity: 4, unit_price: 33, item: item_1) }
  let!(:invoice_items_2) { invoice.invoice_items.create!(quantity: 5, unit_price: 33, item: item_2 )}


   it 'returns all of a associated transactions' do
     get "/api/v1/invoices/#{invoice_id}/transactions"

       expect(response).to be_success

       transactions = JSON.parse(response.body)
       expect(transactions.count).to eq(2)
       expect(transactions.first["result"]).to eq(transaction_1.result)
    end

  it "GET /api/v1/invoices/:id/invoice_items" do
    get "/api/v1/invoices/#{invoice_id}/invoice_items"

        expect(response).to be_success

        invoice_items = JSON.parse(response.body)
        expect(invoice_items.count).to eq(2)
        expect(invoice_items.first["quantity"]).to eq(4)
      end

    it "GET /api/v1/invoices/:id/items" do
      get "/api/v1/invoices/#{invoice_id}/items"

          expect(response).to be_success

          items = JSON.parse(response.body)
          expect(items.count).to eq(2)
          expect(items.last["name"]).to eq('flower')
    end

    it "GET /api/v1/invoices/:id/customer" do
      get "/api/v1/invoices/#{invoice_id}/customer"

      expect(response).to be_success

      customers = JSON.parse(response.body)
      expect(customers["first_name"]).to eq(invoice.customer.first_name)
    end

    it "GET /api/v1/invoices/:id/merchant" do
      get "/api/v1/invoices/#{invoice_id}/merchant"

      expect(response).to be_success

      merchants = JSON.parse(response.body)
      expect(merchants["name"]).to eq(invoice.merchant.name)
    end

end
