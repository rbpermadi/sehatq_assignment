class Schedule < ApplicationRecord
  belongs_to :hcf
  belongs_to :hcp

  validates_presence_of :day
  validates_presence_of :time_start
  validates_presence_of :time_end
  validates_presence_of :hcp_id
  validates_presence_of :hcf_id

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
