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

  it "returns all records based on id" do

    merchant_1 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_2 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_3 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_4 = Merchant.create!(name: "Zoey", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/merchants/find_all?id=#{merchant_1.id}"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    expect(merchants.class).to eq(Array)
  end

  it "returns all records based on name" do
    merchant_1 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_2 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_3 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_4 = Merchant.create!(name: "Zoey", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    expect(merchants.class).to eq(Array)
    expect(merchants.count).to eq(3)
  end

  it "returns all records based on created_at date" do
    merchant_1 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_2 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_3 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_4 = Merchant.create!(name: "Zoey", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    expect(merchants.class).to eq(Array)
    expect(merchants.count).to eq(4)
  end

  it "returns all records based on updated_at date" do
    merchant_1 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_2 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_3 = Merchant.create!(name: "Emily", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    merchant_4 = Merchant.create!(name: "Zoey", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    expect(response).to be_success
    merchants = JSON.parse(response.body)
    expect(merchants.class).to eq(Array)
    expect(merchants.count).to eq(4)
  end
end
