require 'rails_helper'

RSpec.describe HcpSerializer do
  let(:hcp) { FactoryBot.build_stubbed(:hcp) }
  let(:options) { {} }
  let(:serializer) { described_class.new(hcp) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq hcp.id }
  it { expect(subject[:name]).to eq hcp.name }
  it { expect(subject[:description]).to eq hcp.description }
  it { expect(subject[:speciality][:id]).to eq hcp.speciality.id }
  it { expect(subject[:speciality][:name]).to eq hcp.speciality.name }
end
