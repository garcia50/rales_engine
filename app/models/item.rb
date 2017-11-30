class Item < ApplicationRecord
  validates :name, :description, presence: :true

  belongs_to :merchant
  has_many   :invoice_items
  has_many   :invoices, through: :invoice_items

  def self.most_revenue(x)
    joins(invoice_items: [invoice: :transactions])
      .merge(Transaction.successful)
      .group('items.id')
      .order('sum(invoice_items.quantity * invoice_items.unit_price) DESC')
      .take(x)
  end
end
