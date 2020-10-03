require 'rails_helper'

RSpec.describe AuthSerializer do
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:options) { {} }
  let(:serializer) { described_class.new(user) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq user.id }
  it { expect(subject[:name]).to eq user.name }
  it { expect(subject[:email]).to eq user.email }
  it { expect(subject[:image_url]).to eq user.image_url.url.to_s }
  it { expect(subject[:provider]).to eq user.provider }
  it { expect(subject[:uid]).to eq user.uid }
end
