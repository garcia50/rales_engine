require 'rails_helper'

RSpec.describe "user can find invoice by attribute in params", type: :request do
  context "single finders" do
    it "returns search based on the primary key" do
      invoice = create(:invoice)

      get "/api/v1/invoices/find?id=#{invoice.id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(invoice.id)
      expect(json.length).to eq(1)
    end
  end
end