require 'rails_helper'

RSpec.describe Hcf, type: :model do
  let(:hcf) { FactoryBot.build(:hcf) }

  describe 'associations' do
    it { should have_and_belong_to_many(:hcps) }
    it { should have_and_belong_to_many(:medical_facilities) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:hcf_type) }
    it { should validate_presence_of(:province) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:address) }
  end

  describe '.destroy' do
    context 'when destroy hcf' do
      it 'should set deleted to true' do
        expect(hcf.destroy).to be_truthy
        expect(hcf.deleted).to be_truthy
      end
    end
  end
end
