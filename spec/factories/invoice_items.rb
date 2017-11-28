FactoryBot.define do
  factory :invoice_item do
    item
    invoice
    quantity { Faker::Number.number(1) }
    unit_price { Faker::Number.number(3) }
  end
end
