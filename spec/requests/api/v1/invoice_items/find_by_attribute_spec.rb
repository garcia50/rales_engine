require 'rails_helper'

RSpec.describe "user can find invoice item attributes based on search params", type: :request do
  let!(:invoice_item) { create(:invoice_item) }

  context "single finders" do
    it "returns single invoice item based on primary key" do
      get "/api/v1/invoice_items/find?id=#{invoice_item.id}"
      expect(json).to_not be_empty
    end
  end
end