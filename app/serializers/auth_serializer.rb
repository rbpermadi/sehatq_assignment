class AuthSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      name: object.name,
      email: object.email,
      image_url: object.image_url.url.to_s,
      provider: object.provider,
      uid: object.uid
    }
  end
end
