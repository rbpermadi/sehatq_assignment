class Api::V1::HcpsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    params[:limit] = 10 unless params[:limit].present?
    params[:offset] = 0 unless params[:offset].present?

    @hcps = Hcp.offset(params[:offset].to_i).limit(params[:limit].to_i)

    render_serializable(@hcps.to_a, HcpSerializer, {limit: params[:limit], offset: params[:offset], limitation: true})
  end

  def show
    @hcp = Hcp.find(params[:id])

    render_serializable(@hcp, HcpSerializer)
  rescue ActiveRecord::RecordNotFound => error
    render_serializable_error("Hcp not found", status: 404)
  end
end
