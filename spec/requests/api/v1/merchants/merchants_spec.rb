require 'rails_helper'

RSpec.describe 'merchants API' do
  let!(:merchants)   { create_list(:merchant, 10) }
  let!(:merchant_id) { merchants.first.id }

  it "sends a list of merchants" do

    get '/api/v1/merchants'

    expect(response).to be_success

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(10)
    expect(json.first["name"]).to eq(merchants.first["name"])
    expect(json.first["created_at"]).to be_nil
    expect(json.first["updated_at"]).to be_nil
  end

  it "can get one merchant by its id" do

    get "/api/v1/merchants/#{merchant_id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_success
    expect(merchant["id"]).to eq(id)
    expect(json['created_at']).to be_nil
    expect(json['updated_at']).to be_nil
  end
end
