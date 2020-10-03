class HcfSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      name: object.name,
      image_path: object.image_path.url.to_s,
      description: object.description,
      hcf_type: object.hcf_type,
      province: object.province,
      city: object.city,
      district: object.district,
      address: object.address,
      latitude: object.latitude,
      longitude: object.longitude,
      medical_facilities: object.medical_facilities.map { |medical_facility| MedicalFacilitySerializer.new(medical_facility).hash }
    }
  end
end
