class Api::V1::InvoiceItems::FindController < ApplicationController
  def index
    json_response(InvoiceItem.where(valid_params))
  end

  def show
    json_response(InvoiceItem.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id,
                  :invoice_id,
                  :item_id,
                  :quantity,
                  :unit_price,
                  :created_at,
                  :updated_at)
  end
end