FactoryBot.define do
  factory :invoice do
    status { Faker::Hipster.word }
    merchant
    customer
  end
end
