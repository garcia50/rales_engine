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

  describe 'GET /api/v1/items/:id' do
    before { get "/api/v1/items/#{item_id}" }

    context "when resource exists" do
      it "returns an item" do
        expect(json).to_not be_empty
        expect(json['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context "when resource does not exist" do
      let(:item_id) { 200 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end

      it "returns error message" do
        expect(response.body).to match(/Couldn't find Item/)
      end
    end
  end
end