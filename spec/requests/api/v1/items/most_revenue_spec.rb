require 'rails_helper'

RSpec.describe "Item most_revenue API", type: :request do
  describe 'GET /api/v1/items/most_revenue' do
    it "returns the top x items ranked by total revenue generated" do
      items = create_list(:item, 2)

      allow(Item).to receive(:most_revenue).with("2") { items }

      get '/api/v1/items/most_revenue?quantity=2'

      expect(json).to be_instance_of(Array)
      expect(json.first["name"]).to eq(items.first.name)
    end
  end
end