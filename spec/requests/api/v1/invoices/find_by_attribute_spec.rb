require 'rails_helper'

RSpec.describe "user can find invoice by attribute in params", type: :request do
  let!(:invoice) { create(:invoice) }

  context "single finders" do
    it "returns single record based on the primary key" do
      get "/api/v1/invoices/find?id=#{invoice.id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it 'returns single recond based on status' do
      get "/api/v1/invoices/find?status=#{invoice.status}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
      expect(json["status"]).to eq(invoice.status)
    end

    it "returns single record based on created_at date" do
      get "/api/v1/invoices/find?created_at=#{invoice.created_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it 'returns single recored based on updated_at date' do
      get "/api/v1/invoices/find?updated_at=#{invoice.updated_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it "returns single record based on customer_id" do
      get "/api/v1/invoices/find?customer_id=#{invoice.customer_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end

    it "returns single record based on merchant_id" do
      get "/api/v1/invoices/find?merchant_id=#{invoice.merchant_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
    end
  end

  context "multiple finders" do
    it "returns array with a single record based on id" do
      get "/api/v1/invoices/find_all?id=#{invoice.id}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
    end

    it "returns multiple records based on status" do
      invoice_1 = create(:invoice, status: 'cool')
      invoice_2 = create(:invoice, status: 'cool')

      get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on created_at" do
      invoice_1 = create(:invoice, created_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")
      invoice_2 = create(:invoice, created_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")

      get "/api/v1/invoices/find_all?created_at=#{invoice_1.created_at}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it 'returns multiple records based on updated_at' do
      invoice_1 = create(:invoice, updated_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")
      invoice_2 = create(:invoice, updated_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")

      get "/api/v1/invoices/find_all?updated_at=#{invoice_1.updated_at}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it 'returns multiple records based on customer_id' do
      customer  = create(:customer)
      invoice_1 = create(:invoice, customer: customer)
      invoice_2 = create(:invoice, customer: customer)

      get "/api/v1/invoices/find_all?customer_id=#{invoice_1.customer_id}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it 'returns multiple records based on merchant_id' do
      merchant  = create(:merchant)
      invoice_1 = create(:invoice, merchant: merchant)
      invoice_2 = create(:invoice, merchant: merchant)

      get "/api/v1/invoices/find_all?merchant_id=#{invoice_1.merchant_id}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end
  end
end