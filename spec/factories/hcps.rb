FactoryBot.define do
  factory :hcp, class: 'hcp' do
    name { 'dr. Muhammad Rezal, MT' }
    image_path { '/uploads/hcp/image/18/image_path.png' }
    description { 'dr. Muhammad Rezal, MT merupakan seorang dokter umum. Saat ini beliau berpraktik di RS Universitas Indonesia (RSUI) di Depok' }

    before(:create) do |hcp, evaluator|
      speciality = FactoryBot.create :speciality
      hcp.speciality_id = speciality&.id
    end

    after(:stub) do |hcp, evaluator|
      speciality = FactoryBot.build_stubbed :speciality if hcp.speciality.nil?
      hcp.stub(:speciality).and_return speciality
    end
  end
end
