require 'rails_helper'

RSpec.describe "Api::V1::MedicalFacilities", type: :request do
  let!(:medical_facility) { FactoryBot.create(:medical_facility, id: 1) }
  let(:medical_facility_id) { medical_facility.id }
  # get medical_facility list
  describe 'GET /api/v1/medical-facilities' do
    context 'success' do
      before { get '/api/v1/medical-facilities/' }
      it 'shows list of medical facilities' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(response_data["data"].size).to eq(1)
      end
    end
  end

  # find speciality
  describe 'GET /api/v1/medical-facilities/:id' do
    before { get "/api/v1/medical-facilities/#{medical_facility_id}" }

    context 'success' do
      it 'shows label data' do
        response_data = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(response_data['data']['id']).to eq(medical_facility.id)
        expect(response_data['data']['name']).to eq(medical_facility.name)
      end
    end

    context 'error' do
      let(:medical_facility_id) { 0 }
      it 'shows not found error' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(response_data['errors']).to eq('Medical facility not found')
      end
    end
  end
end
