class Api::V1::Customers::InvoicesController < ApplicationController
  def index
    json_response(Customer.find(params[:id]).invoices)
  end
end