class SpecialitySerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      name: object.name
    }
  end
end
