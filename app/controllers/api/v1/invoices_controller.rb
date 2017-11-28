class Api::V1::InvoicesController < ApplicationController
  def index
    json_response(Invoice.all)
  end

  def show
    json_response(Invoice.find(params[:id]))
  end
end