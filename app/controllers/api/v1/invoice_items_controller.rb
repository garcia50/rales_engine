class Api::V1::InvoiceItemsController < ApplicationController
  def index
    json_response(InvoiceItem.all)
  end

  def show
    json_response(Invoice.find(params[:id]))
  end
end
