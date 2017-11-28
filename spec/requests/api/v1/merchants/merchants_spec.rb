require 'rails_helper'

RSpec.describe 'merchants API' do
  it "sends a list of merchants" do
     create_list(:merchant, 10)

      get '/api/v1/merchants'

      expect(response).to be_success

      merchants = JSON.parse(response.body)
      expect(merchants.count).to eq(10)
   end
end
