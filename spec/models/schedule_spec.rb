require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:month) }
  end

  describe 'scopes' do
    it 'returns schedules for a given user' do
      user1 = create(:user)
      user2 = create(:user)
      schedule1 = create(:schedule, user: user1)
      schedule2 = create(:schedule, user: user2)

      expect(Schedule.for_user(user1)).to include(schedule1)
      expect(Schedule.for_user(user1)).not_to include(schedule2)
    end

    it 'returns schedules for a given month' do
      user = create(:user)
      schedule1 = create(:schedule, user: user, month: '2024-10-1')
      schedule2 = create(:schedule, user: user, month: '2024-11-1')

      expect(Schedule.for_month('2024-10-1')).to include(schedule1)
      expect(Schedule.for_month('2024-10-1')).not_to include(schedule2)
    end
  end
end
