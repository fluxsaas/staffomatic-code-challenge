# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    payroll_enabled { Faker::Boolean.boolean }
    target_duration_per_month { Faker::Number.number(digits: 5) }
  end
end
