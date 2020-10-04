class Consultation < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates_presence_of :user_id
  validates_presence_of :schedule_id
  validates_presence_of :date

  def destroy
    self.deleted = true
    self.save(validate: false)
  end
end
