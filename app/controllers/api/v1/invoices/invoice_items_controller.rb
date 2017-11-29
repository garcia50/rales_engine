class Api::V1::Invoices::InvoiceItemsController < ApplicationController
  def index
    json_response(Invoice.find(params[:id]).invoice_items)
  end
end
