require 'rails_helper'

RSpec.describe 'merchants BI API' do
  let!(:merchant_1)      { Merchant.create!(name: "Emily") }
  let!(:merchant_2)      { Merchant.create!(name: "Hugh") }
  let!(:customer)        { create(:customer) }
  let!(:invoice_1)       { merchant_1.invoices.create!(status: 'success', customer: customer, created_at: "2012-03-16 11:55:05") }
  let!(:invoice_2)       { merchant_2.invoices.create!(status: 'success', customer: customer) }
  let!(:item_1)          { Item.create!(name: "zoey", description: "a dog" , unit_price: 30, merchant_id: merchant_1.id) }
  let!(:item_2)          { Item.create!(name: "flower", description: "red", unit_price: 50, merchant_id: merchant_2.id) }
  let!(:invoice_items_1) { invoice_1.invoice_items.create!(quantity: 1, unit_price: 1000, item: item_1) }
  let!(:invoice_items_2) { invoice_2.invoice_items.create!(quantity: 10, unit_price: 1000, item: item_2) }

  it 'returns the top x merchants ranked by total number of items sold' do
    get "/api/v1/merchants/most_items?quantity=1"

      expect(response).to be_success

      merchants = JSON.parse(response.body)
      expect(merchants.class).to eq(Array)
      expect(merchants.count).to eq(1)
      expect(merchants.first.name).to eq("Hugh")
   end

 end
