class Customer < ApplicationRecord
  validates :first_name, presence: :true
  validates :last_name, presence: :true

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants
    .select("merchants.*, count(invoices.customer_id) as number_of_invoices")
    .joins(invoices: [:transactions])
    .merge(Transaction.successful)
    .group('merchants.id')
    .order('number_of_invoices DESC')
    .first
  end


end
