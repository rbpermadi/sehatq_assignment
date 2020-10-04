require 'rails_helper'

RSpec.describe Hcp, type: :model do
  let(:hcp) { FactoryBot.build(:hcp) }

  describe 'associations' do
    it { should have_and_belong_to_many(:hcfs) }
    it { should belong_to(:speciality) }
    it { should have_many(:schedule) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:speciality_id) }
  end

  describe '.destroy' do
    context 'when destroy hcp' do
      it 'should set deleted to true' do
        expect(hcp.destroy).to be_truthy
        expect(hcp.deleted).to be_truthy
      end
    end
  end
end
