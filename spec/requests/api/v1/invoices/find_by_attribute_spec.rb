require 'rails_helper'

RSpec.describe "user can find invoice by attribute in params", type: :request do
  let!(:invoice) { create(:invoice) }

  context "single finders" do
    it "returns search based on the primary key" do
      get "/api/v1/invoices/find?id=#{invoice.id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it 'returns json based on status' do
      get "/api/v1/invoices/find?status=#{invoice.status}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
      expect(json["status"]).to eq(invoice.status)
    end

    it "returns a record based on created_at date" do
      get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it 'returns a recored based on updated_at date' do
      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it "returns a record based on customer_id" do
      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it "returns a record based on merchant_id" do
      get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end
  end
end