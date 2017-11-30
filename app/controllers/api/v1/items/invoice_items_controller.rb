class Api::V1::Items::InvoiceItemsController < ApplicationController
  def index
    json_response(Item.find(params[:id]).invoice_items)
  end
end
