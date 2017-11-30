require 'rails_helper'

RSpec.describe "user can find invoice item attributes based on search params", type: :request do
  let!(:invoice_item) { create(:invoice_item) }

  context "single finders" do
    it "returns single invoice item based on primary key" do
      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice_item.id)
    end

    it "returns single record based on quantity" do
      get "/api/v1/invoice_items/find?invoice_id=#{invoice_item.invoice_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice_item.id)
    end

    it "returns single record based on item_id" do
      get "/api/v1/invoice_items/find?item_id=#{invoice_item.item_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice_item.id)
    end

    it "returns single record based on quantity" do
      get "/api/v1/invoice_items/find?quantity=#{invoice_item.quantity}"

      expect(json).to_not be_empty
      expect(json["quantity"]).to eq(invoice_item.quantity)
    end

    it "returns single record based on unit_price" do
      get "/api/v1/invoice_items/find?unit_price=#{invoice_item.unit_price}"

      expect(json).to_not be_empty
      expect(json["unit_price"]).to eq(invoice_item.unit_price)
    end

    it "returns single record based on created_at" do
      get "/api/v1/invoice_items/find?created_at=#{invoice_item.created_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice_item.id)
    end

    it "returns single record based on updated_at" do
      get "/api/v1/invoice_items/find?updated_at=#{invoice_item.updated_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice_item.id)
    end
  end

  context "multiple finders" do
    it "returns array with a single record based on id" do
      get "/api/v1/invoice_items/find_all?id=#{invoice_item.id}"

    end
  end
end