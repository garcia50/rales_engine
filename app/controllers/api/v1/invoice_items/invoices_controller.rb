class Api::V1::InvoiceItems::InvoicesController < ApplicationController
  def show
    json_response(InvoiceItem.find(params[:id]).invoice)
  end
end
