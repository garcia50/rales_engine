class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price

  def unit_price
    if !object.unit_price.nil?
      (object.unit_price / 100.0).to_s
    end
  end
end