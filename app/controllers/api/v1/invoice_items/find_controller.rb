class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    render json: InvoiceItem.delegate_multiple_finder(params,valid_params)
  end

  def show
    render json: InvoiceItem.delegate_single_finder(params, valid_params)
  end

  private

  def valid_params
    params.permit(:id, :invoice_id, :item_id, :quantity, :unit_price, :created_at, :updated_at)
  end
end