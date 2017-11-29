class Api::V1::Customers::TransactionsController < ApplicationController
  def index
    json_response(Customer.find(params[:id]).transactions)
  end
end