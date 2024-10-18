require 'rails_helper'

RSpec.describe Payroll, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:month) }
  end

  it 'returns payrolls for a given user' do
    user1 = create(:user)
    user2 = create(:user)
    payroll1 = create(:payroll, user: user1)
    payroll2 = create(:payroll, user: user2)

    expect(Payroll.for_user(user1)).to include(payroll1)
    expect(Payroll.for_user(user1)).not_to include(payroll2)
  end

  describe 'scopes' do
    it 'returns payrolls for a given month' do
      user = create(:user)
      october_payroll = create(:payroll, user: user, month: '2024-10-1')
      create(:payroll, user: user, month: '2024-11-1')

      expect(Payroll.for_month('2024-10-1')).to include(october_payroll)
    end
  end
end
