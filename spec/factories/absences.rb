# spec/factories/absences.rb
FactoryBot.define do
  factory :absence do
    starts_at { Faker::Date.between(from: 1.month.ago, to: Date.today) }
    ends_at { Faker::Date.between(from: Date.today, to: 1.month.from_now) }
    duration { Faker::Number.number(digits: 4) }
    association :user
  end
end
