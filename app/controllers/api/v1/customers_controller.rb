class Api::V1::CustomersController < ApplicationController
  def index
    json_response(Customer.all)
  end
end
