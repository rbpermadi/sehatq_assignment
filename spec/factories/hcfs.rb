FactoryBot.define do
  factory :hcf, class: 'hcf' do
    name { 'RS Universitas Indonesia (RSUI)' }
    image_path  { '/uploads/hcf/image/18/image_path.png' }
    description { 'Rumah Sakit Universitas Indonesia (RSUI) merupakan Rumah Sakit Pendidikan Tinggi Negeri (RS-PTN) pertama di Indonesia' }
    hcf_type { :rumah_sakit }
    province { 'Jawa Barat' }
    city { 'Depok' }
    district { 'Beji' }
    address { 'Jalan Prof. Bahder Djohan Kampus UI' }
    latitude { -6.371997 }
    longitude { 106.829894 }
  end
end
