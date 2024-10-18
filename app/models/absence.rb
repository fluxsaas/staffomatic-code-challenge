class Absence < ApplicationRecord
  belongs_to :user

  validates :starts_at, :ends_at, presence: true

  scope :for_month, ->(month) { where("starts_at <= ? AND ends_at >= ?", month.end_of_month, month.beginning_of_month) }
  scope :for_user, ->(user) { where(user: user) }
end
