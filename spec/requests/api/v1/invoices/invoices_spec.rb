require 'rails_helper'

RSpec.describe 'invoices API', type: :request do
  let!(:invoices)   { create_list(:invoice, 10) }
  let!(:invoice_id) { invoices.first.id }

  describe "GET /api/v1/invoices" do
    before { get "/api/v1/invoices" }

    it "returns all invoices" do
      expect(json).to_not be_empty
      expect(json.length).to eq(10)
      expect(json.first["status"]).to eq(invoices.first["status"])
      expect(json.first["created_at"]).to be_nil
      expect(json.first["updated_at"]).to be_nil
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/invoices/:id" do
    before { get "/api/v1/invoices/#{invoice_id}" }

    context "when resource exists" do
      it 'returns an invoice' do
        expect(json).to_not be_empty
        expect(json['id']).to eq(invoice_id)
        expect(json['created_at']).to be_nil
        expect(json['updated_at']).to be_nil
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when resource does not exist" do
      let!(:invoice_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns ultra robust error message" do
        expect(response.body).to match(/Couldn't find Invoice/)
      end
    end
  end
end
