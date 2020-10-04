class Api::V1::MedicalFacilitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @medical_facilities = MedicalFacility.all
    render_serializable(@medical_facilities.to_a, MedicalFacilitySerializer)
  end

  def show
    @medical_facility = MedicalFacility.find(params[:id])

    render_serializable(@medical_facility, MedicalFacilitySerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Medical facility not found", status: 404)
  end
end
