require 'rails_helper'

RSpec.describe 'transaction API' do
  let!(:transactions)   { create_list(:transaction, 10) }
  let!(:transaction_id) { transactions.first.id }

  it "sends a list of transactions" do

      get '/api/v1/transactions'

      expect(response).to be_success

      expect(json.first["result"]).to eq(transactions.first["result"])
      expect(json.first["created_at"]).to be_nil
      expect(json.first["updated_at"]).to be_nil
   end

  it "can get one transaction by its id" do

    get "/api/v1/transactions/#{transaction_id}"

    expect(response).to be_success
    expect(json['id']).to eq(transaction_id)
    expect(json["created_at"]).to be_nil
    expect(json["updated_at"]).to be_nil
  end

end
