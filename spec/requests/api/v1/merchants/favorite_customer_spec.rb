require 'rails_helper'

RSpec.describe "Merchant favorite customer API", type: :request do
  describe 'GET /api/v1/merchants/:id/favorite_customer' do
    it "returns a favorite customer for a merchant" do
      merchant = double()
      customer = create(:customer)
      allow(Merchant).to receive(:find).with("1") { merchant }
      expect(merchant).to receive(:favorite_customer).once { customer }

      get "/api/v1/merchants/1/favorite_customer"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(customer.id)

    end
  end
end


# describe "get /api/v1/merchants/:id/revenue" do
#   it "calls revenue on the merchant specified in the params and returns revenue as json" do
    
#     expect(response).to be_success
#     # merchant = double()
#     # allow(Merchant).to receive(:find).with("1") { merchant }
#     # expect(merchant).to receive(:revenue).once { 700.12 }

#     # get "/api/v1/merchants/1/revenue"

#     # revenue = JSON.parse(response.body, symbolize_names: true)

#     # expect(response).to be_success
#     # expect(revenue).to have_key(:revenue)
#     # expect(revenue[:revenue]).to eq("700.12")
#   end
# end

# it "returns the customer who has conducted the most total number of successful transactions" do
#   merchant = create(:merchant)
#   customer_1 = create(:customer)
#   customer_2 = create(:customer)
#   customer_1_invoices = create_list(:invoice, 2, customer_id: customer_1.id, merchant_id: merchant.id)
#   customer_2_invoice = create(:invoice, customer_id: customer_2.id, merchant_id: merchant.id)
#   create(:transaction, invoice_id: customer_2_invoice.id, result: "success")
#   customer_1_invoices.each do |invoice|
#     create(:transaction, invoice_id: invoice.id, result: "success")
#   end

#   get "/api/v1/merchants/#{merchant.id}/favorite_customer"
#   customer = JSON.parse(response.body)

#   expect(response).to be_success
#   expect(customer).to be_instance_of(Hash)
#   expect(customer["id"]).to eq(customer_1.id)
# end