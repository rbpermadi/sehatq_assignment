class ScheduleDateSerializer < ApplicationSerializer
  def hash
    {
      id: object[:schedule].id,
      day: object[:schedule].day,
      date: object[:date],
      time_start: object[:schedule].time_start.to_s(:time),
      time_end: object[:schedule].time_end.to_s(:time),
      hcp: { id: object[:schedule].hcp.id, name: object[:schedule].hcp.name },
      hcf: HcfSerializer.new(object[:schedule].hcf).hash,
    }
  end
end
