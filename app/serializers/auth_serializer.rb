class AuthSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      name: object.name,
      email: object.email,
      image_path: object.image_url.url.to_s,
      provider: object.provider,
      uid: object.uid
    }
  end
end
