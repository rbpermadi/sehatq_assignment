require 'rails_helper'

RSpec.describe Consultation, type: :model do
  let(:consultation) { FactoryBot.build(:consultation) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:schedule) }
  end

  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:schedule_id) }
  end

  describe '.destroy' do
    context 'when destroy consultation' do
      it 'should set deleted to true' do
        expect(consultation.destroy).to be_truthy
        expect(consultation.deleted).to be_truthy
      end
    end
  end
end
