class Api::V1::ConsultationsController < Api::V1::ApplicationController
  def index
    params[:limit] = 10 unless params[:limit].present?
    params[:offset] = 0 unless params[:offset].present?

    @consultations = @resource.consultations
    @consultations = @consultations.where(schedule_id: params[:schedule_id].to_i) if params[:schedule_id].present?
    @consultations = @consultations.offset(params[:offset].to_i).limit(params[:limit].to_i)

    render_serializable(@consultations.to_a, ConsultationSerializer, {limit: params[:limit], offset: params[:offset], limitation: true})
  end

  def show
    @consultation = Consultation.find(params[:id])

    render_serializable(@consultation, ConsultationSerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Consultation not found", status: 404)
  end

  def create
    validate

    @consultation = Consultation.new
    @consultation.assign_attributes consultation_params
    @consultation.save!

    render_serializable(@consultation, ConsultationSerializer, status: 201)
  rescue StandardError => error
    render_serializable_error(error, status: 400)
  end

  private

  def validate
    sch = Schedule.find(consultation_params[:schedule_id])

    day = Date.strptime(consultation_params[:date], '%Y-%m-%d').strftime("%a").downcase
    raise "Date is not the same day with schedule" unless sch.day == day

    raise "Fully booked" unless Consultation.where(schedule_id: consultation_params[:schedule_id], date: consultation_params[:date]).count < 10

    time_diff = (sch.time_start.to_time.strftime("%H:%M").to_time - Time.current)
    raise "Cannot book consultation because it less than 30 minutes from start" if (time_diff / 1.minute).round < 30 && consultation_params[:date].to_date.today?
  end

  def consultation_params
    params[:consultation][:user_id] = @resource.id
    params.require(:consultation).permit(:user_id, :schedule_id, :date)
  end
end
