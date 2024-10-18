require 'rails_helper'

RSpec.describe Absence, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
  end

  describe 'scopes' do
    it 'returns absences for a given user' do
      user1 = create(:user)
      user2 = create(:user)
      absence1 = create(:absence, user: user1)
      absence2 = create(:absence, user: user2)

      expect(Absence.for_user(user1)).to include(absence1)
      expect(Absence.for_user(user1)).not_to include(absence2)
    end

    it 'returns absences for a given month' do
      user = create(:user)
      absence1 = create(:absence, user: user, starts_at: '2024-10-01', ends_at: '2024-10-05')
      absence2 = create(:absence, user: user, starts_at: '2024-11-01', ends_at: '2024-11-05')

      expect(Absence.for_month(Date.parse('2024-10-01'))).to include(absence1)
      expect(Absence.for_month(Date.parse('2024-10-01'))).not_to include(absence2)
    end
  end
end
