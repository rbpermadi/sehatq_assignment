require 'rails_helper'

RSpec.describe HcfSerializer do
  let(:hcf) { FactoryBot.build_stubbed(:hcf) }
  let(:options) { {} }
  let(:serializer) { described_class.new(hcf) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq hcf.id }
  it { expect(subject[:name]).to eq hcf.name }
  it { expect(subject[:description]).to eq hcf.description }
  it { expect(subject[:hcf_type]).to eq hcf.hcf_type }
  it { expect(subject[:province]).to eq hcf.province }
  it { expect(subject[:city]).to eq hcf.city }
  it { expect(subject[:district]).to eq hcf.district }
  it { expect(subject[:address]).to eq hcf.address }
  it { expect(subject[:latitude]).to eq hcf.latitude }
  it { expect(subject[:longitude]).to eq hcf.longitude }
end
