class Api::V1::Invoices::RandomController < ApplicationController
  def show
    json_response(Invoice.random)
  end
end
