class Payroll < ApplicationRecord
  belongs_to :user

  validates :month, presence: true

  scope :for_month, ->(month) { where(month: month) }
  scope :for_user, ->(user) { where(user: user) }
end
