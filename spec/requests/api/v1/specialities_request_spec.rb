require 'rails_helper'

RSpec.describe "Api::V1::Specialities", type: :request do
  let!(:speciality) { FactoryBot.create(:speciality, id: 1) }
  let(:speciality_id) { speciality.id }
  # get speciality list
  describe 'GET /api/v1/specialities' do
    context 'success' do
      before { get '/api/v1/specialities' }
      it 'shows list of specialities' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(response_data["data"].size).to eq(1)
      end
    end
  end

  # find label
  describe 'GET /api/v1/specialities/:id' do
    before { get "/api/v1/specialities/#{speciality_id}" }

    context 'success' do
      it 'shows label data' do
        response_data = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(response_data['data']['id']).to eq(speciality.id)
        expect(response_data['data']['name']).to eq(speciality.name)
      end
    end

    context 'error' do
      let(:speciality_id) { 0 }
      it 'shows not found error' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(response_data['errors']).to eq('Speciality not found')
      end
    end
  end
end
