class Api::V1::Transactions::FindController < ApplicationController

  def index
    json_response(Transaction.where(valid_params))
  end

  def show
    json_response(Transaction.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id, :result, :invoice_id, :created_at, :updated_at, :credit_card_number)
  end

end
