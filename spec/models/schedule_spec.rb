require 'rails_helper'

RSpec.describe Schedule, type: :model do
  let(:schedule) { FactoryBot.build(:schedule) }

  describe 'associations' do
    it { should belong_to(:hcf) }
    it { should belong_to(:hcp) }
  end

  describe 'validations' do
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:time_start) }
    it { should validate_presence_of(:time_end) }
  end

  describe '.destroy' do
    context 'when destroy schedule' do
      it 'should set deleted to true' do
        expect(schedule.destroy).to be_truthy
        expect(schedule.deleted).to be_truthy
      end
    end
  end
end
