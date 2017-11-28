require 'rails_helper'

RSpec.describe 'customers API' do
  let!(:customers)   { create_list(:customer, 10) }
  let!(:customer_id) { customers.first.id }

  it "sends a list of customers" do

    get '/api/v1/customers'

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.count).to eq(10)
    expect(json.first["first_name"]).to eq(customers.first["first_name"])
    expect(json.first["last_name"]).to eq(customers.first["last_name"])
    expect(json.first["created_at"]).to be_nil
    expect(json.first["updated_at"]).to be_nil
  end

  it "can get one customer by its id" do

    get "/api/v1/customers/#{customer_id}"

    customer = JSON.parse(response.body)

    expect(response).to be_success
    expect(json["id"]).to eq(customer_id)
    expect(json['created_at']).to be_nil
    expect(json['updated_at']).to be_nil
  end

end
