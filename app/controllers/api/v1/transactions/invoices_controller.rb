class Api::V1::Transactions::InvoicesController < ApplicationController
  before_action :set_invoice, only: [:index]

  def index
    json_response(Transaction.find(params[:id]).invoice)
  end

  private

  def set_invoice
    transaction = Transaction.find(params[:id])
    @invoice = transaction.invoice if transaction
  end
end