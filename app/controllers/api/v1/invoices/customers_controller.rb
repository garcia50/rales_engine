class Api::V1::Invoices::CustomersController < ApplicationController
  def index
    json_response(Invoice.find(params[:id]).customer)
  end
end
