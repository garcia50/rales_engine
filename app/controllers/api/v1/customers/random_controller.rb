class Api::V1::Customers::RandomController < ApplicationController
  def show
    json_response(Customer.random)
  end
end
