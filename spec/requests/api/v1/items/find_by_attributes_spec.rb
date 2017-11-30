require 'rails_helper'

RSpec.describe "user can find item by attribute in params", type: :request do
  let!(:item) { create(:item) }

  context "single finders" do
    it "returns single record based on primary key" do
      get "/api/v1/items/find?id=#{item.id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(item.id)
    end

    it "returns single record based on name" do
      get "/api/v1/items/find?name=#{item.name}"

      expect(json).to_not be_empty
      expect(json["name"]).to eq(item.name)
    end

    it 'returns a single record based on description' do
      get "/api/v1/items/find?description=#{item.description}"

      expect(json["description"]).to eq(item.description)
    end

    it 'returns a single record based on unit_price' do
      get "/api/v1/items/find?unit_price=#{item.unit_price}"

      expect(json).to_not be_empty
      expect(json["unit_price"]).to eq((item.unit_price / 100.0).to_s)
    end

    it 'returns a single record based on created_at' do
      get "/api/v1/items/find?created_at=#{item.created_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(item.id)
    end

    it 'returns a single record based on updated_at' do
      get "/api/v1/items/find?updated_at=#{item.updated_at}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(item.id)
    end

    it 'returns a single record based on merchant_id' do
      get "/api/v1/items/find?merchant_id=#{item.merchant_id}"

      expect(json).to_not be_empty
      expect(json["id"]).to eq(item.id)
    end
  end

  context "multiple finders" do
    it "returns array with a single record based on id" do
      get "/api/v1/items/find_all?id=#{item.id}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
    end

    it "returns multiple records based on name" do
      item_1 = create(:item, name: 'cool')
      item_2 = create(:item, name: 'cool')

      get "/api/v1/items/find_all?name=#{item_1.name}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on description" do
      item_1 = create(:item, description: 'carne a suh dude')
      item_2 = create(:item, description: 'carne a suh dude')

      get "/api/v1/items/find_all?description=#{item_1.description}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on unit_price" do
      item_1 = create(:item, unit_price: 2)
      item_2 = create(:item, unit_price: 2)

      get "/api/v1/items/find_all?unit_price=#{item_1.unit_price}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on created_at" do
      item_1 = create(:item, created_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")
      item_2 = create(:item, created_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")

      get "/api/v1/items/find_all?created_at=#{item_1.created_at}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on updated_at" do
      item_1 = create(:item, updated_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")
      item_2 = create(:item, updated_at: "Thu, 30 Nov 2017 00:05:02 UTC +00:00")

      get "/api/v1/items/find_all?updated_at=#{item_1.updated_at}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end

    it "returns multiple records based on merchant_id" do
      merchant = create(:merchant)
      item_1   = create(:item, merchant: merchant)
      item_2   = create(:item, merchant: merchant)

      get "/api/v1/items/find_all?merchant_id=#{item_1.merchant_id}"

      expect(json).to_not be_empty
      expect(json.class).to be(Array)
      expect(json.length).to eq(2)
    end
  end
end