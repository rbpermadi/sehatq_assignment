class Api::V1::SpecialitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @specialities = Speciality.all
    render_serializable(@specialities.to_a, SpecialitySerializer)
  end

  def show
    @speciality = Speciality.find(params[:id])

    render_serializable(@speciality, SpecialitySerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Speciality not found", status: 404)
  end
end
