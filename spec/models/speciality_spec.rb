require 'rails_helper'

RSpec.describe Speciality, type: :model do
  describe 'associations' do
    it { should have_many(:hcps) }
  end
  
  describe 'validations' do
    it { should validate_uniqueness_of(:name).with_message("already used.") }
    it { should validate_presence_of(:name) }
  end
end
