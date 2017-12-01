class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :unit_price, :item_id, :invoice_id, :quantity

  def unit_price
    (object.unit_price / 100.0).to_s
  end
end