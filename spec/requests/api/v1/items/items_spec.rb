require 'rails_helper'

RSpec.describe 'items API', type: :request do
  let!(:items)   { create_list(:item, 10) }
  let!(:item_id) { items.first.id }

  describe 'GET /api/v1/items' do
    before { get "/api/v1/items" }

    it 'returns all items' do
      expect(json).to_not be_empty
      expect(json.length).to eq(10)
      expect(json.first["name"]).to eq(items.first["name"])
      expect(json.first["description"]).to eq(items.first["description"])
      expect(json.first["created_at"]).to be_nil
      expect(json.first["updated_at"]).to be_nil
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)

    end
  end
end