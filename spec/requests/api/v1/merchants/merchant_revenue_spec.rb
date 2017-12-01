require 'rails_helper'

RSpec.describe 'merchant BI API' do
  let!(:merchant)        { create(:merchant) }
  let!(:merchant_id)     { merchant.id }
  let!(:customer)        { create(:customer) }
  let!(:invoice_1)       { merchant.invoices.create!(status: 'success', customer: customer, created_at: "2012-03-16 11:55:05") }
  let!(:invoice_2)       { merchant.invoices.create!(status: 'success', customer: customer) }
  let!(:transaction_1)   { invoice_1.transactions.create!(result: "success" ) }
  let!(:transaction_2)   { invoice_2.transactions.create!(result: "failed" ) }
  let!(:item_1)          { Item.create!(name: "zoey", description: "a dog" , unit_price: 30, merchant_id: merchant.id) }
  let!(:item_2)          { Item.create!(name: "flower", description: "red", unit_price: 50, merchant_id: merchant.id) }
  let!(:invoice_items_1) { invoice_1.invoice_items.create!(quantity: 4, unit_price: 1000, item: item_1) }
  let!(:invoice_items_2) { invoice_2.invoice_items.create!(quantity: 5, unit_price: 1000, item: item_2) }

  it 'returns total revenue of a associated merchant' do
    get "/api/v1/merchants/#{merchant_id}/revenue"

      expect(response).to be_success

      revenue = JSON.parse(response.body)
      expect(revenue).to eq({"revenue"=>"40.0"})
      expect(revenue).to_not eq(50)
   end

   it 'returns total revenue for a specific date of a associated merchant' do
     get "/api/v1/merchants/#{merchant_id}/revenue?date=#{invoice_1.created_at}"

       expect(response).to be_success

       revenue = JSON.parse(response.body)
       expect(revenue).to eq({"revenue"=>"40.0"})
    end
 end
