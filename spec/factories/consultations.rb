FactoryBot.define do
  factory :consultation do
    date { '2020-10-30' }
    user_id { 1 }
    schedule_id { 1 }

    before(:create) do |consultation, evaluator|
      user = FactoryBot.create :user
      user.user_id = user&.id

      schedule = FactoryBot.create :schedule
      consultation.schedule_id = schedule&.id
    end

    before(:build) do |consultation, evaluator|
      user = FactoryBot.build :user
      consultation.user_id = user&.id

      schedule = FactoryBot.build :schedule
      consultation.schedule_id = schedule&.id
    end

    after(:stub) do |consultation, evaluator|
      user = FactoryBot.build_stubbed :user if consultation.user.nil?
      consultation.stub(:user).and_return user

      schedule = FactoryBot.build_stubbed :schedule if consultation.schedule.nil?
      consultation.stub(:schedule).and_return schedule
    end
  end
end
