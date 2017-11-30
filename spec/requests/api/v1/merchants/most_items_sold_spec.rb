require 'rails_helper'

RSpec.describe 'merchant most items sold API' do

  it 'returns the top x merchants ranked by total number of items sold' do
    merchants = create_list(:merchant, 3)
    allow(Merchant).to receive(:most_items_sold).with("1") { merchants }

    get "/api/v1/merchants/most_items?quantity=1"

      expect(response).to be_success

      merchant = JSON.parse(response.body)
      expect(merchants.class).to eq(Array)
      expect(merchant.first["name"]).to eq(merchants.first.name)
   end
 end
