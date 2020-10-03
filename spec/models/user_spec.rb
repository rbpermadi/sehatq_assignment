require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe '.destroy' do
    context 'when destroy user' do
      it 'should set deleted to true' do
        expect(user.destroy).to be_truthy
        expect(user.deleted).to be_truthy
      end
    end
  end
end
