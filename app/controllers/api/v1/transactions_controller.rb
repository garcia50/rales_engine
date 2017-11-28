class Api::V1::TransactionsController < ApplicationController

  def index
    json_response(Transaction.all)
  end

  def show
    json_response(Transaction.find(params[:id]))
  end  
end
