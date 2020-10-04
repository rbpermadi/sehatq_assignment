class Hcf < ApplicationRecord
  has_and_belongs_to_many :hcps
  has_and_belongs_to_many :medical_facilities
  has_many :schedule

  mount_base64_uploader :image_path, ImagePathUploader, file_name: (0...8).map { (65 + rand(26)).chr }.join

  enum hcf_type: { rumah_sakit: 1, puskesmas: 2, lab: 3, klinik: 4, klinik_gigi: 5, klinik_mata: 6 }

  scope :not_deleted, -> { where(deleted: false) }

  validates_presence_of :name
  validates_presence_of :hcf_type
  validates_presence_of :province
  validates_presence_of :city
  validates_presence_of :district
  validates_presence_of :address

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
