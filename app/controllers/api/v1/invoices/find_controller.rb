class Api::V1::Invoices::FindController < ApplicationController
  def index
    json_response(Invoice.where(valid_params))
  end

  def show
    json_response(Invoice.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id, :status, :created_at, :updated_at, :customer_id, :merchant_id)
  end
end

