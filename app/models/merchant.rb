class Merchant < ApplicationRecord
  validates :name, presence: :true
  has_many :items
  has_many :invoices

  def total_revenue(date = nil)
    if date
      invoices.joins(:transactions, :invoice_items)
      .where(invoices: {created_at: "#{date}"})
      .merge(Transaction.successful)
      .sum('invoice_items.unit_price * invoice_items.quantity')
    else
      invoices.joins(:transactions, :invoice_items)
      .merge(Transaction.successful)
      .sum('invoice_items.unit_price * invoice_items.quantity')
    end  
  end

  def total_revenue_response
    formatted_revenue = total_revenue/100.0
    {revenue: formatted_revenue}
  end
end
