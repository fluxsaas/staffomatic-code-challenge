# spec/models/public_holiday_spec.rb
require 'rails_helper'

RSpec.describe PublicHoliday, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
  end

  it 'returns public holidays for a given user' do
    user1 = create(:user)
    user2 = create(:user)
    holiday1 = create(:public_holiday, user: user1)
    holiday2 = create(:public_holiday, user: user2)

    expect(PublicHoliday.for_user(user1)).to include(holiday1)
    expect(PublicHoliday.for_user(user1)).not_to include(holiday2)
  end

  describe 'scopes' do
    it 'returns public holidays for a given month' do
      user = create(:user)
      holiday1 = create(:public_holiday, user: user, starts_at: '2024-10-01', ends_at: '2024-10-05')
      holiday2 = create(:public_holiday, user: user, starts_at: '2024-11-01', ends_at: '2024-11-05')

      expect(PublicHoliday.for_month(Date.parse('2024-10-01'))).to include(holiday1)
      expect(PublicHoliday.for_month(Date.parse('2024-10-01'))).not_to include(holiday2)
    end
  end
end
