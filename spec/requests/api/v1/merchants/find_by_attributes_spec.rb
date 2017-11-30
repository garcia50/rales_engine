require 'rails_helper'

RSpec.describe "user can find item by attribute in params", type: :request do
  let!(:merchants) { create(:merchant) }

  it "returns a single record based on id" do
    get "/api/v1/merchants/find?id=#{merchants.id}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq(merchants.name)
    expect(merchant["created_at"]).to be_nil
    expect(merchant["updated_at"]).to be_nil
  end

  it "returns a single record based on name" do
    get "/api/v1/merchants/find?name=#{merchants.name}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq(merchants.name)
    expect(merchant["created_at"]).to be_nil
    expect(merchant["updated_at"]).to be_nil
  end

  it "returns a single record based on created_at" do
    get "/api/v1/merchants/find?created_at=#{merchants.created_at}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq(merchants.name)
  end

  it "returns a single record based on updated_at" do
    get "/api/v1/merchants/find?created_at=#{merchants.updated_at}"

    expect(response).to be_success

    merchant = JSON.parse(response.body)
    expect(merchant["name"]).to eq(merchants.name)
  end
end
