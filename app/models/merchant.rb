class Merchant < ApplicationRecord
  validates :name, presence: :true
  has_many :items
  has_many :invoices

  def total_revenue
    invoices.joins(:transactions, :invoice_items)
    .merge(Transaction.successful)
    .sum('invoice_items.unit_price * invoice_items.quantity')
  end

  def total_revenue_response
    formatted_revenue = total_revenue/100.0
    {revenue: formatted_revenue}
  end  
end
