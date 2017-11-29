class Api::V1::Transactions::InvoicesController < ApplicationController
  def index
    json_response(Transaction.find(params[:id]).invoice)
  end
end