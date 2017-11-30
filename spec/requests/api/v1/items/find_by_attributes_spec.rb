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

      expect(json).to_not be_empty
      expect(json["description"]).to eq(item.description)
    end

    it 'returns a single record based on unit_price' do
      get "/api/v1/items/find?unit_price=#{item.unit_price}"

      expect(json).to_not be_empty
      expect(json["unit_price"]).to eq(item.unit_price)
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
end