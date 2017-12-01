class InvoiceItem < ApplicationRecord
  validates  :quantity, :unit_price, presence: :true
  belongs_to :invoice
  belongs_to :item

  def self.delegate_single_finder(params, valid_params)
    if params["unit_price"]
      InvoiceItem.find_by(unit_price: (params["unit_price"].to_f * 100).round(2))
    else
      InvoiceItem.find_by(valid_params)
    end
  end

  def self.delegate_multiple_finder(params, valid_params)
    if params["unit_price"]
      InvoiceItem.where(unit_price: (params["unit_price"].to_f * 100).round(2))
    else
      InvoiceItem.where(valid_params)
    end
  end
end
