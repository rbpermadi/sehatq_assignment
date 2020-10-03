class MedicalFacility < ApplicationRecord
  has_and_belongs_to_many :hcfs

  validates_uniqueness_of :name, message: 'already used.'
  validates_presence_of :name
end
