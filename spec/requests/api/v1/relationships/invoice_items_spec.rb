require 'rails_helper'

RSpec.describe "Invoice_items relationships API", type: :request do
  let!(:invoice) {create(:invoice)}
  let!(:item) { create(:item)}
  let!(:invoice_items_1) { InvoiceItem.create!(quantity: 4, unit_price: 33, item: item, invoice: invoice) }
  let!(:invoice_item_id) { invoice_items_1.id }

  it 'returns associated invoice' do
    get "/api/v1/invoice_items/#{invoice_item_id}/invoice"

      expect(response).to be_success

      invoice = JSON.parse(response.body)

      expect(invoice["status"]).to eq(invoice_items_1.invoice.status)
   end

   it 'returns associated invoice' do
     get "/api/v1/invoice_items/#{invoice_item_id}/item"

       expect(response).to be_success

       item = JSON.parse(response.body)

       expect(item["name"]).to eq(invoice_items_1.item.name)
    end
end


# GET /api/v1/invoice_items/:id/item returns the associated item
