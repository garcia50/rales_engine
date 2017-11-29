class Api::V1::Merchants::InvoicesController < ApplicationController
  def index
    json_response(Merchant.find(params[:id]).invoices)
  end
end