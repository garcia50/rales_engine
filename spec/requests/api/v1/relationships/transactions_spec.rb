require 'rails_helper'

RSpec.describe "Transaction relationships API" do
  let!(:transaction)    { create(:transaction) }
  let!(:transaction_id) { transaction.id }

  describe "GET api/v1/transactions/:id/invoice" do
    before { get "/api/v1/transactions/#{transaction_id}/invoice"}

    context "when transaction exists" do

      it "returns an associated invoice" do
        expect(json).to_not be_empty
        expect(json["id"]).to eq(transaction.invoice.id)
        expect(json["status"]).to eq(transaction.invoice.status)
      end

      it "returns HTTP status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when transaction does not exist" do
      let!(:transaction_id) { 432 }

      it "returns HTTP status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns ultra robust error message" do
        expect(response.body).to match(/Couldn't find Transaction/)
      end
    end
  end
end