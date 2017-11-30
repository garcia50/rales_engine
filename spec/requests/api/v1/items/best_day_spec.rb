require 'rails_helper'

RSpec.describe 'date with the most invoices sold' do

  it 'returns the date with the most sales for the given item using the invoice date' do
    item = create(:item)
    customer = create(:customer)
    invoice_items = create(:invoice_item)

    allow(Item).to receive(:find).with("1") { customer }
    allow(item).to receive(:best_day) { invoice_items }

    get "/api/v1/items/1/best_day"

      expect(response).to be_success

      day = JSON.parse(response.body)

      expect(day["created_at"]).to eq(invoice_items.created_at)
   end
 end
