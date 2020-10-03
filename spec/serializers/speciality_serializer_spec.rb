require 'rails_helper'

RSpec.describe SpecialitySerializer do
  let(:speciality) { FactoryBot.build_stubbed(:speciality) }
  let(:options) { {} }
  let(:serializer) { described_class.new(speciality) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq speciality.id }
  it { expect(subject[:name]).to eq speciality.name }
end
