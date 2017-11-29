class Api::V1::Invoices::MerchantsController < ApplicationController
  def index
    json_response(Invoice.find(params[:id]).merchant)
  end
end
