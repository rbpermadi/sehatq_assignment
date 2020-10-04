class Api::V1::SchedulesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    params[:limit] = 10 unless params[:limit].present?
    params[:offset] = 0 unless params[:offset].present?

    @schedules = Schedule
    @schedules = @schedules.where(hcf_id: params[:hcf_id].to_i) if params[:hcf_id].present?
    @schedules = @schedules.where(hcp_id: params[:hcp_id].to_i) if params[:hcp_id].present?
    @schedules = @schedules.offset(params[:offset].to_i).limit(params[:limit].to_i)

    render_serializable(@schedules.to_a, ScheduleSerializer, {limit: params[:limit], offset: params[:offset], limitation: true})
  end

  def show
    @schedule = Schedule.find(params[:id])

    render_serializable(@schedule, ScheduleSerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Schedule not found", status: 404)
  end

  def date
    params[:start_date] = Time.current.strftime("%Y-%m-%d") unless params[:start_date].present?
    params[:end_date] = (Time.current + 7.days).strftime("%Y-%m-%d") unless params[:end_date].present?

    @result = []
    while (params[:end_date].to_date - params[:start_date].to_date).to_i >= 0 do
      day = Date.strptime(params[:start_date], '%Y-%m-%d').strftime("%a").downcase
      @schedules = Schedule
      @schedules = @schedules.where(hcf_id: params[:hcf_id].to_i) if params[:hcf_id].present?
      @schedules = @schedules.where(hcp_id: params[:hcp_id].to_i) if params[:hcp_id].present?
      @schedules = @schedules.where(day: day).order(time_start: :asc)
      @schedules.each do |sch|
        next unless Consultation.where(schedule_id: sch.id, date: params[:start_date]).count < 10
        @result << {
          date: params[:start_date],
          schedule: sch,
        } 
      end
      params[:start_date] = (params[:start_date].to_date + 1.days).strftime("%Y-%m-%d")
    end
    render_serializable(@result, ScheduleDateSerializer)
  end
end
