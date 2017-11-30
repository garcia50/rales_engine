require 'rails_helper'

RSpec.describe "Item relationships API", type: :request do
  let!(:merchant)   { create(:merchant) }
  let!(:items) { Item.create!(name: "zoey", description: "a dog" , unit_price: 30, merchant_id: merchant.id)}
  let!(:item_id) { items.id }
  let!(:invoice) {create(:invoice)}
  let!(:invoice_items_1) { InvoiceItem.create!(quantity: 4, unit_price: 33, item: items, invoice: invoice) }
  let!(:invoice_items_2) { InvoiceItem.create!(quantity: 5, unit_price: 33, item: items, invoice: invoice )}

  it 'returns all of a associated invoice_items' do
    get "/api/v1/items/#{item_id}/invoice_items"

      expect(response).to be_success

      invoice_items = JSON.parse(response.body)
      expect(invoice_items.count).to eq(2)
      expect(invoice_items.first["quantity"]).to eq(invoice_items_1.quantity)
   end

   it 'returns associated merchant' do
     get "/api/v1/items/#{item_id}/merchant"

       expect(response).to be_success

       merchant = JSON.parse(response.body)

       expect(merchant["name"]).to eq(items.merchant.name)
    end


end



# GET /api/v1/items/:id/merchant returns the associated merchant
