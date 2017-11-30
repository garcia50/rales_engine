class Api::V1::Customers::FindController < ApplicationController
  def index
    json_response(Customer.where(valid_params))
  end

  def show
    json_response(Customer.find_by(valid_params))
  end

  private

  def valid_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
