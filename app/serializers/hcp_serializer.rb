class HcpSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      name: object.name,
      image_path: object.image_path.url.to_s,
      description: object.description,
      speciality: {id: object.speciality.id, name: object.speciality.name},
      hcfs: object.hcfs.map { |hcf| HcfSerializer.new(hcf).hash }
    }
  end
end
