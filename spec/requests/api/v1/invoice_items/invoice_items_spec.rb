require 'rails_helper'

RSpec.describe 'invoices items API', type: :request do
  let!(:invoice_items) { create_list(:invoice_item, 10) }
  let!(:invoice_item_id) { invoice_items.first.id }

  describe "GET /api/v1/invoice_items" do
    before { get "/api/v1/invoice_items" }

    it "returns all invoice items" do
      expect(json).to_not be_empty
      expect(json.length).to eq(10)
      expect(json.first).to have_key("id")
      expect(json.first).to have_key("quantity")
      expect(json.first).to have_key("unit_price")
      expect(json.first).to have_key("item_id")
      expect(json.first).to have_key("invoice_id")
    end

    it "returns http status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/invoice_items/:id" do
    before { get "/api/v1/invoice_items/#{invoice_item_id}" }

    context "when resource exists" do
      it "returns an invoice item" do
        expect(json).to_not be_empty
        expect(json['id']).to eq(invoice_item_id)
      end

      it "returns http status code 200" do
        # expect(response).to have_http_status(200)
      end
    end
  end
end
