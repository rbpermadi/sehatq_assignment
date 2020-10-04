class ScheduleSerializer < ApplicationSerializer
  def hash
    {
      id: object.id,
      day: object.day,
      time_start: object.time_start.to_s(:time),
      time_end: object.time_end.to_s(:time),
      hcp: { id: object.hcp.id, name: object.hcp.name },
      hcf: HcfSerializer.new(object.hcf).hash,
    }
  end
end
