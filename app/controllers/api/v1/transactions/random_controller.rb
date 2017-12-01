class Api::V1::Transactions::RandomController < ApplicationController
  def show
    json_response(Transaction.random)
  end
end
