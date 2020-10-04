FactoryBot.define do
  factory :schedule do
    day { 'sun' }
    time_start { '06:00:00' }
    time_end { '09:00:00' }
    hcf_id { 1 }
    hcp_id { 1 }

    before(:create) do |schedule, evaluator|
      hcp = FactoryBot.create :hcp
      schedule.hcp_id = hcp&.id

      hcf = FactoryBot.create :hcf
      schedule.hcf_id = hcf&.id
    end

    before(:build) do |schedule, evaluator|
      byebug
      hcp = FactoryBot.build :hcp
      schedule.hcp_id = hcp&.id

      hcf = FactoryBot.build :hcf
      schedule.hcf_id = hcf&.id
    end

    after(:stub) do |schedule, evaluator|
      hcp = FactoryBot.build_stubbed :hcp if schedule.hcp.nil?
      schedule.stub(:hcp).and_return hcp

      hcf = FactoryBot.build_stubbed :hcf if schedule.hcf.nil?
      schedule.stub(:hcf).and_return hcf
    end
  end
end
