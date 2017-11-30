require 'rails_helper'

RSpec.describe 'favorite merchant with the most succesful transactions API' do

  it ' returns a merchant where the customer has conducted the most successful transactions' do
    merchants = create(:merchant)
    customer = create(:customer)


    allow(Customer).to receive(:find).with("1") { customer }
    allow(customer).to receive(:favorite_merchant) { merchants }

    get "/api/v1/customers/1/favorite_merchant"

      expect(response).to be_success

      merchant = JSON.parse(response.body)
    

      expect(merchant["name"]).to eq(merchants.name)
   end
 end
