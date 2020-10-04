class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  before_save -> { skip_confirmation! }

  mount_base64_uploader :image_url, ImagePathUploader, file_name: (0...8).map { (65 + rand(26)).chr }.join

  scope :not_deleted, -> { where(deleted: false) }

  before_validation :set_uid

  has_many :consultations

  def self.from_omniauth(auth)
    where(provider: auth.provider.to_s, uid: auth.uid.to_s).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
      user.skip_confirmation!
    end
  end

  def set_uid
    self.uid = self.class.generate_uid if self.uid.blank?
  end

  def self.generate_uid
    loop do
      token = Devise.friendly_token
      break token unless to_adapter.find_first({ uid: token })
    end
  end

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
