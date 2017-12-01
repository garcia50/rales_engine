require 'rails_helper'

RSpec.describe 'date with the most invoices sold' do

  it 'returns the date with the most sales for the given item using the invoice date' do
    item = create(:item)
    invoice = create(:invoice, created_at: "2012-03-27 14:53:59")
    invoice_items = create(:invoice_item, invoice: invoice, created_at: "2012-03-27 14:53:59")

    allow(Item).to receive(:find).with("1") { item }
    allow(item).to receive(:best_day) { invoice_items }

    get "/api/v1/items/1/best_day"

      expect(response).to be_success

      day = JSON.parse(response.body)
    
      expect(day["best_day"]["created_at"]).to eq("2012-03-27T14:53:59.000Z")
   end
 end
