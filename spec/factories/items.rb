FactoryBot.define do
  factory :item do
    name { Faker::Hipster.word }
    description { Faker::Hipster.sentence}
    unit_price { Faker::Number.number(3) }
    merchant
  end
end
