# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spc = [{ name: "Akupuntur" }, { name:"Dokter Anak" }, { name:"Dokter Sp Andrologi" }, { name:"Dokter Bedah" }, { name:"Dokter Bedah Anak" }, { name:"Dokter Bedah Plastik" }, { name:"Dokter Sp Endokrin" }, { name:"Fisio Terapi" }, { name:"Dokter Gigi" }, { name:"Dokter Sp Ginjal" }, { name:"Ahli Gizi" }, { name:"Dokter Sp Hematologi" }, { name:"Dokter Sp Jantung" }, { name:"Dokter Jiwa" }, { name:"Dokter Sp Kandungan" }, { name:"Dokter Sp Kulit" }, { name:"Dokter Sp Mata" }, { name:"Dokter Sp Onkologi" }, { name:"Dokter Umum" }]
specialities = Speciality.create(spc)

mf = [{ name: "Ambulans" }, { name:"ICU" }, { name:"IGD" }, { name:"NICU" }, { name:"PICU" }, { name:"Apotek" }, { name:"Cuci Darah" }, { name:"ICCU" }, { name:"Bank Darah" }, { name:"MCU" }, { name:"Radiologi" }]
medical_facilities = MedicalFacility.create(mf)

hcf_payload = [
  {
    name: 'RS Universitas Indonesia (RSUI)',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcp/rs-ui.png").read),
    description: 'Rumah Sakit Universitas Indonesia (RSUI) merupakan Rumah Sakit Pendidikan Tinggi Negeri (RS-PTN) pertama di Indonesia',
    province: 'Jawa Barat',
    city: 'Depok',
    district: 'Beji',
    address: 'Jalan Prof. Bahder Djohan Kampus UI',
    latitude: -6.371997,
    longitude: 106.829894,
    hcf_type: :rumah_sakit,
    medical_facility_ids: [medical_facilities[0].id, medical_facilities[1].id, medical_facilities[2].id],
  },
  {
    name: 'RS Universitas Islam Indonesia',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcp/rs-uii.png").read),
    description: 'RS Universitas Islam Indonesia merupakan rumah sakit yang berlokasi di Pandak, Bantul.',
    province: 'DI Yogyakarta',
    city: 'Bantul',
    district: 'Pandak',
    address: 'Jalan Srandakan Km. 5,5',
    latitude: -7.909605,
    longitude: 110.296688,
    hcf_type: :rumah_sakit,
    medical_facility_ids: [medical_facilities[3].id, medical_facilities[4].id, medical_facilities[5].id],
  }
]
hcfs = Hcf.create(hcf_payload)

hcp_payload = [
  {
    name: 'dr. Rina Juwita, Sp.PD',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcf/dr-rina.png").read),
    description: 'dr. Rina Juwita, Sp.PD merupakan seorang dokter spesialis penyakit dalam. Saat ini beliau berpraktik di RS Happy Land di Yogyakarta, RSK Bedah An Nur Yogyakarta di Sleman, RS Universitas Islam Indonesia di Bantul',
    speciality_id: specialities[13].id,
    hcf_ids: [hcfs[0].id, hcfs[1].id],
  },
  {
    name: 'dr. Diah Hydrawati Sari Hasibuan, Sp.OG',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcf/dr-diah.png").read),
    description: 'dr. Diah Hydrawati Sari Hasibuan, Sp.OG merupakan seorang dokter spesialis kebidanan dan kandungan. Saat ini beliau berpraktik di RS Jogja International Hospital (JIH) di Sleman, RS Universitas Islam Indonesia di Bantul',
    speciality_id: specialities[1].id,
    hcf_ids: [hcfs[0].id],
  },
  {
    name: 'Prof. Dr. dr. Raden Irawati Ismail',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcf/dr-irawati.png").read),
    description: 'Prof. Dr. dr. Raden Irawati Ismail, Sp.KJ(K), M.Epid merupakan seorang dokter spesialis kedokteran jiwa konsultan. Saat ini beliau berpraktik di RS Universitas Indonesia (RSUI) di Depok',
    speciality_id: specialities[13].id,
    hcf_ids: [hcfs[0].id, hcfs[1].id],
  },
  {
    name: 'Prof. Dr. dr. Budi Wiweko, Sp.OG(K)FER, MPH',
    image_path: 'data:image/png;base64,'+Base64.strict_encode64(Rails.root.join("db/images/hcf/dr-budi.png").read),
    description: 'Prof. Dr. dr. Budi Wiweko, Sp.OG(K)FER, MPH adalah seorang Dokter Spesialis Kebidanan dan Kandungan. ',
    speciality_id: specialities[14].id,
    hcf_ids: [hcfs[1].id],
  }
]
hcps = Hcp.create(hcp_payload)

sch_payload = [
  {
    hcf_id: hcfs[0].id,
    hcp_id: hcps[0].id,
    day: "sun",
    time_start: "06:00",
    time_end: "09:00",
  },
  {
    hcf_id: hcfs[0].id,
    hcp_id: hcps[0].id,
    day: "mon",
    time_start: "06:00",
    time_end: "09:00",
  },
  {
    hcf_id: hcfs[1].id,
    hcp_id: hcps[0].id,
    day: "sun",
    time_start: "06:00",
    time_end: "09:00",
  },
  {
    hcf_id: hcfs[0].id,
    hcp_id: hcps[1].id,
    day: "wed",
    time_start: "16:00",
    time_end: "19:00",
  },
  {
    hcf_id: hcfs[0].id,
    hcp_id: hcps[2].id,
    day: "sun",
    time_start: "19:00",
    time_end: "22:00",
  },
  {
    hcf_id: hcfs[1].id,
    hcp_id: hcps[2].id,
    day: "fri",
    time_start: "13:00",
    time_end: "15:00",
  },
  {
    hcf_id: hcfs[1].id,
    hcp_id: hcps[3].id,
    day: "sat",
    time_start: "15:00",
    time_end: "17:00",
  },
]
schedules = Schedule.create(sch_payload)


