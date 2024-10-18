require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:schedules) }
    it { should have_many(:payrolls) }
    it { should have_many(:absences) }
    it { should have_many(:public_holidays) }
  end

  describe 'validations' do
    it { should validate_presence_of(:target_duration_per_month) }
  end
end
