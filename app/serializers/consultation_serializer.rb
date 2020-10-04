class ConsultationSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      date: object.date,
      users: {id: object.user.id, name: object.user.name, email: object.user.email},
      schedule: ScheduleSerializer.new(object.schedule).hash
    }
  end
end
