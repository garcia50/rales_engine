require 'rails_helper'

RSpec.describe "Merchant total_revenue_by_date API", type: :request do
  describe 'GET /api/v1/merchants/revenue?date=x' do
    it "returns the total revenue for date x across all merchants" do
      date = "2012-03-16 11:55:05"

      allow(Merchant).to receive(:total_revenue).with(date) { 500 }

      get "/api/v1/merchants/revenue?date=#{date}"

      expect(json).to eq({"total_revenue"=>"5.0"})
    end
  end
end