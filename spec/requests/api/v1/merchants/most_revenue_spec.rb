require "rails_helper"

RSpec.describe "Merchants with most_revenue API" do
  describe "GET /api/v1/merchants/most_revenue?quantity=x" do
    it 'returns the top x merchants ranked by total revenue' do
      merchants = create_list(:merchant, 3)
      allow(Merchant).to receive(:most_revenue).with("3") { merchants }

      get "/api/v1/merchants/most_revenue?quantity=3"

      merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(merchants.class).to eq(Array)
      expect(json.length).to eq(3)
    end
  end
end