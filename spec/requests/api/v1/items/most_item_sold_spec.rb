require 'rails_helper'

RSpec.describe "Item most_quantity API", type: :request do
  describe 'GET /api/v1/items/most_quantity' do
    it "returns the top x item instances ranked by total number sold" do
      items = create_list(:item, 4)

      allow(Item).to receive(:most_quantity).with("2") { items }

      get '/api/v1/items/most_quantity?quantity=2'

      expect(json).to be_instance_of(Array)

      expect(json.first["name"]).to eq(items.first.name)
      expect(json.count).to eq(4)
    end
  end
end
