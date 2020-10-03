require 'rails_helper'

RSpec.describe MedicalFacilitySerializer do
  let(:medical_facility) { FactoryBot.build_stubbed(:medical_facility) }
  let(:options) { {} }
  let(:serializer) { described_class.new(medical_facility) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq medical_facility.id }
  it { expect(subject[:name]).to eq medical_facility.name }
end
