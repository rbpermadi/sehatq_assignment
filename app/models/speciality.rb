class Speciality < ApplicationRecord
  has_many :hcps

  validates_uniqueness_of :name, message: 'already used.'
  validates_presence_of :name
end
