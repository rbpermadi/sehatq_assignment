require 'rails_helper'

RSpec.describe ScheduleSerializer do
  let(:schedule) { FactoryBot.build_stubbed(:schedule) }
  let(:options) { {} }
  let(:serializer) { described_class.new(schedule) }

  subject { serializer.hash }

  it { expect(subject[:id]).to eq schedule.id }
  it { expect(subject[:day]).to eq schedule.day }
  it { expect(subject[:time_start]).to eq schedule.time_start.to_s(:time) }
  it { expect(subject[:time_end]).to eq schedule.time_end.to_s(:time) }
end
