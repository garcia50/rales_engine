class Api::V1::TransactionsController < ApplicationController

  def index
    json_response(Transaction.all)
  end
end
