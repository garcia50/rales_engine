require 'rails_helper'

RSpec.describe "Merchant relationships API", type: :request do
  let!(:merchant)    { create(:merchant) }
  let!(:customer)    { create(:customer) }
  let!(:merchant_id) { merchant.id }
  let!(:item_1)      { merchant.items.create!(name: "cool", description: 'stuff', unit_price: 200) }
  let!(:item_2)      { merchant.items.create!(name: "burritos", description: 'aww yea', unit_price: 200) }
  let!(:invoice_1)   { merchant.invoices.create!(status: 'cool', customer: customer) }
  let!(:invoice_2)   { merchant.invoices.create!(status: 'chill', customer: customer) }

  describe 'GET /api/v1/merchants/:id/items' do
    before { get "/api/v1/merchants/#{merchant_id}/items" }

    context "when the merchant exists" do
      it "returns all of a merchant's items" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["name"]).to eq(item_1.name)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the merchant does not exist" do
      let!(:merchant_id) { 1000 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Merchant/)
      end
    end
  end

  describe "GET /api/v1/merchants/:id/invoices" do
    before { get "/api/v1/merchants/#{merchant_id}/invoices" }

    context "when the merchant exists" do
      it "returns all of a merchants invoices" do
        expect(json).to_not be_empty
        expect(json.length).to eq(2)
        expect(json.first["status"]).to eq(invoice_1.status)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the merchant does not exist" do
      let!(:merchant_id) { 232323 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns an error message" do
        expect(response.body).to match(/Couldn't find Merchant/)
      end
    end
  end
end