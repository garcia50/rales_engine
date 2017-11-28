require 'rails_helper'

RSpec.describe 'items API', type: :request do
  let!(:items)   { create_list(:item, 10) }
  let!(:item_id) { items.first.id }

  describe 'GET /api/v1/items' do
    before { get "/api/v1/items" }

    it 'returns all items' do
      
    end
  end
end