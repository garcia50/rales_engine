class Api::V1::Invoices::ItemsController < ApplicationController
  def index
    json_response(Invoice.find(params[:id]).items)
  end
end
