FactoryBot.define do
  factory :speciality, class: 'speciality' do
    name { Faker::Name.name }
  end
end
