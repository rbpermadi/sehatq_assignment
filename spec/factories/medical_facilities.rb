FactoryBot.define do
  factory :medical_facility, class: 'medical_facility' do
    name { Faker::Name.name }
  end
end
