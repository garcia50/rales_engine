require 'rails_helper'

RSpec.describe "user can find item by attribute in params", type: :request do
  let!(:transactions) { create(:transaction) }

  it "returns a single record based on id" do
    get "/api/v1/transactions/find?id=#{transactions.id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)
    expect(transaction["result"]).to eq(transactions.result)
    expect(transaction["created_at"]).to be_nil
    expect(transaction["updated_at"]).to be_nil
  end

  it "returns a single record based on result" do
    get "/api/v1/transactions/find?result=#{transactions.result}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)
    expect(transaction["result"]).to eq(transactions.result)
    expect(transaction["created_at"]).to be_nil
    expect(transaction["updated_at"]).to be_nil
  end

  it "returns a single record based on invoice_id" do
    get "/api/v1/transactions/find?invoice_id=#{transactions.invoice_id}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)
    expect(transaction["result"]).to eq(transactions.result)
    expect(transaction["created_at"]).to be_nil
    expect(transaction["updated_at"]).to be_nil
  end

  it "returns a single record based on created_at" do
    get "/api/v1/transactions/find?created_at=#{transactions.created_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)
    expect(transaction["result"]).to eq(transactions.result)
  end

  it "returns a single record based on updated_at" do
    get "/api/v1/transactions/find?created_at=#{transactions.updated_at}"

    expect(response).to be_success

    transaction = JSON.parse(response.body)
    expect(transaction["result"]).to eq(transactions.result)
  end

  it "returns all records based on id" do

    transaction_1 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_2 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_3 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_4 = Transaction.create!(result: "failed", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/transactions/find_all?id=#{transaction_1.id}"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Array)
  end

  it "returns all records based on result" do
    transaction_1 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_2 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_3 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_4 = Transaction.create!(result: "failed", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/transactions/find_all?result=#{transaction_1.result}"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Array)
    expect(transactions.count).to eq(3)
  end

  it "returns all records based on invoice_id" do
    transaction_1 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_2 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_3 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_4 = Transaction.create!(result: "failed", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/transactions/find_all?invoice_id=#{transaction_1.invoice_id}"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Array)
    expect(transactions.count).to eq(4)
  end

  it "returns all records based on created_at date" do
    transaction_1 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_2 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_3 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_4 = Transaction.create!(result: "failed", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Array)
    expect(transactions.count).to eq(4)
  end

  it "returns all records based on updated_at date" do
    transaction_1 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_2 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_3 = Transaction.create!(result: "succes", invoice_id: 1, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")
    transaction_4 = Transaction.create!(result: "failed", invoice_id: 3, created_at: "2012-03-27T14:54:05.000Z", updated_at: "2012-03-27T14:54:05.000Z")

    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"

    expect(response).to be_success
    transactions = JSON.parse(response.body)
    expect(transactions.class).to eq(Array)
    expect(transactions.count).to eq(3)
  end
end
