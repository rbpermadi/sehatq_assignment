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
end
