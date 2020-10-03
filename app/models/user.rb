class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_base64_uploader :image_url, ImagePathUploader, file_name: (0...8).map { (65 + rand(26)).chr }.join

  scope :not_deleted, -> { where(deleted: false) }

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
