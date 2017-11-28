class Api::V1::CustomersController < ApplicationController
  def index
    json_response(Customer.all)
  end

  def show
    json_response(Customer.find(params[:id]))
  end  
end
