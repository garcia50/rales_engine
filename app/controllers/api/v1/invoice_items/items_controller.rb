class Api::V1::InvoiceItems::ItemsController < ApplicationController
  def show
    json_response(InvoiceItem.find(params[:id]).item)
  end
end
