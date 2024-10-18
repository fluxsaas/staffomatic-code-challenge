class User < ApplicationRecord
  has_many :schedules
  has_many :payrolls
  has_many :absences
  has_many :public_holidays

  validates :target_duration_per_month, presence: true
end
