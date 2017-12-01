class Api::V1::Merchants::CustomersController < ApplicationController
  def index
    json_response(Merchant.find(params["id"]).customers_with_pending_invoices)
  end

  def show
    json_response(Merchant.find(params["id"]).favorite_customer)
  end
end