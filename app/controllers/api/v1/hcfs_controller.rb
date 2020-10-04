class Api::V1::HcfsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    params[:limit] = 10 unless params[:limit].present?
    params[:offset] = 0 unless params[:offset].present?
    
    @hcfs = Hcf.offset(params[:offset].to_i).limit(params[:limit].to_i)

    render_serializable(@hcfs.to_a, HcfSerializer, {limit: params[:limit], offset: params[:offset], limitation: true})
  end

  def show
    @hcf = Hcf.find(params[:id])

    render_serializable(@hcf, HcfSerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Hcf not found", status: 404)
  end
end
