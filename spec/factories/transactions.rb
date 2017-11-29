FactoryBot.define do
  factory :transaction do
    result { Faker::Hipster.word }
    invoice
  end
end
