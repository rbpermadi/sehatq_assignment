require 'rails_helper'

RSpec.describe "Api::V1::Hcfs", type: :request do
  let!(:hcf) { FactoryBot.create(:hcf, id: 1, hcf_type: :rumah_sakit) }
  let(:hcf_id) { hcf.id }
  
  # get hcfs list
  describe 'GET /api/v1/hcfs' do
    describe 'success' do
      context 'shows list of hcf' do
        before { get '/api/v1/hcfs/'}
        it 'without limit and offset' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["data"].size).to eq(1)
          expect(response_data["meta"]["limit"]).to eq(10)
          expect(response_data["meta"]["offset"]).to eq(0)
        end
      end
      
      context 'without offset' do
        let(:params) { { limit: 5 } }

        before { get '/api/v1/hcfs/', params: params }

        it 'shows list of hcfs' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(0)
        end
      end

      context 'without limit' do
        let(:params) { { offset: 5 } }

        before { get '/api/v1/hcfs/', params: params }

        it 'shows list of hcfs' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(10)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end

      context 'with offset and offset' do
        let(:params) { { limit: 5, offset: 5 } }
        
        before { get '/api/v1/hcfs/', params: params }

        it 'shows list of hcfs' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end
    end
  end

  # find hcfs
  describe 'GET /api/v1/hcfs/:id' do
    before { get "/api/v1/hcfs/#{hcf_id}" }

    context 'success' do
      let(:expected_result) do
        {
          data: {
            id: hcf.id,
            name: hcf.name,
            image_path: hcf.image_path.url.to_s,
            description: hcf.description,
            hcf_type: hcf.hcf_type,
            province: hcf.province,
            city: hcf.city,
            district: hcf.district,
            address: hcf.address,
            latitude: hcf.latitude.to_s,
            longitude: hcf.longitude.to_s,
            medical_facilities: [],
          },
          meta: {
            status: 200
          }
        }
      end

      it 'shows hcf data' do
        response_data = JSON.parse(response.body).deep_symbolize_keys!
        expect(response.status).to eq(200)
        expect(response_data).to eq(expected_result)
      end
    end

    context 'error' do
      let(:hcf_id) { 0 }
      it 'shows not found error' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(response_data['errors']).to eq('Hcf not found')
      end
    end
  end
end
