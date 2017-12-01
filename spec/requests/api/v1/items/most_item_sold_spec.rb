require 'rails_helper'

RSpec.describe "Item most_quantity API", type: :request do
  describe 'GET /api/v1/items/most_sold' do
    it "returns the top x item instances ranked by total number sold" do
      items = create_list(:item, 4)

      allow(Item).to receive(:most_items).with("1"){ items }

      get '/api/v1/items/most_items?quantity=1'


      expect(json).to be_instance_of(Array)


      expect(json.first["name"]).to eq(items.first.name)
    end
  end
end
