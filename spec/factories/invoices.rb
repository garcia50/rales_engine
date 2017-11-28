FactoryBot.define do
  factory :invoice do
    status { Faker::Hipster.word }
  end
end
