require 'rails_helper'
RSpec.describe "user can find item by attribute in params", type: :request do
  let!(:customers) { create(:customer) }

  it "returns a single record based on id" do
    get "/api/v1/customers/find?id=#{customers.id}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq(customers.first_name)
    expect(customer["created_at"]).to be_nil
    expect(customer["updated_at"]).to be_nil
  end

  it "returns a single record based on name" do
    get "/api/v1/customers/find?first_name=#{customers.first_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq(customers.first_name)
    expect(customer["created_at"]).to be_nil
    expect(customer["updated_at"]).to be_nil
  end

  it "returns a single record based on last name" do
    get "/api/v1/customers/find?last_name=#{customers.last_name}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["last_name"]).to eq(customers.last_name)
    expect(customer["created_at"]).to be_nil
    expect(customer["updated_at"]).to be_nil
  end

  it "returns a single record based on created_at" do
    get "/api/v1/customers/find?created_at=#{customers.created_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq(customers.first_name)
  end

  it "returns a single record based on updated_at" do
    get "/api/v1/customers/find?updated_at=#{customers.updated_at}"

    expect(response).to be_success

    customer = JSON.parse(response.body)
    expect(customer["first_name"]).to eq(customers.first_name)
  end

  it "returns all records based on id" do

    customer_1 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_2 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_3 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_4 = Customer.create!(first_name: "Zoey", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/customers/find_all?id=#{customer_1.id}"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.class).to eq(Array)
  end

  it "returns all records based on name" do
    customer_1 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_2 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_3 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_4 = Customer.create!(first_name: "Zoey", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name}"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.class).to eq(Array)
    expect(customers.count).to eq(3)
  end

  it "returns all records based on last name" do
    customer_1 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_2 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_3 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_4 = Customer.create!(first_name: "Zoey", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/customers/find_all?last_name=#{customer_1.last_name}"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.class).to eq(Array)
    expect(customers.count).to eq(3)
  end

  it "returns all records based on created_at date" do
    customer_1 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_2 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_3 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_4 = Customer.create!(first_name: "Zoey", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.class).to eq(Array)
    expect(customers.count).to eq(4)
  end

  it "returns all records based on updated_at date" do
    customer_1 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_2 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_3 = Customer.create!(first_name: "Emily", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    customer_4 = Customer.create!(first_name: "Zoey", last_name: "Yellow", created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}"

    expect(response).to be_success
    customers = JSON.parse(response.body)
    expect(customers.class).to eq(Array)
    expect(customers.count).to eq(4)
  end
end
