class Api::V1::InvoiceItems::RandomController < ApplicationController
  def show
    json_response(InvoiceItem.random)
  end
end
