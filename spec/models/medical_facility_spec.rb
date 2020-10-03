require 'rails_helper'

RSpec.describe MedicalFacility, type: :model do
  describe 'associations' do
    it { should have_and_belong_to_many(:hcfs) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name).with_message("already used.") }
    it { should validate_presence_of(:name) }
  end
end
