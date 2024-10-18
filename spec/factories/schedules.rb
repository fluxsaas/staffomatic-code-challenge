# spec/factories/schedules.rb
FactoryBot.define do
  factory :schedule do
    month { "2024-#{Faker::Number.between(from: 1, to: 12)}-1" }
    assigned_duration_per_month { Faker::Number.number(digits: 4) }
    association :user
  end
end
