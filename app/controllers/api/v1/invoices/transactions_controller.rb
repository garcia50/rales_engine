class Api::V1::Invoices::TransactionsController < ApplicationController
  def index
    json_response(Invoice.find(params[:id]).transactions)
  end
end
