FactoryBot.define do
  factory :transaction do
    credit_card_number {Faker::Number.number(16)}
    credit_card_expiration_date {Faker::Date.between(2.days.ago, Date.today)}
    result { Faker::Hipster.word }
  end
end
