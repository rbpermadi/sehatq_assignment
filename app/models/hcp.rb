class Hcp < ApplicationRecord
  has_and_belongs_to_many :hcfs
  belongs_to :speciality

  mount_base64_uploader :image_path, ImagePathUploader, file_name: (0...8).map { (65 + rand(26)).chr }.join 

  validates_presence_of :name
  validates_presence_of :speciality_id

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
