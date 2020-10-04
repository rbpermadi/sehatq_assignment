require 'rails_helper'

RSpec.describe "Api::V1::Hcps", type: :request do
  let!(:hcp) { FactoryBot.create(:hcp, id: 1) }
  let(:hcp_id) { hcp.id }

  # get hcps list
  describe 'GET /api/v1/hcps' do
    describe 'success' do
      context 'shows list of hcp' do
        before { get '/api/v1/hcps/'}
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

        before { get '/api/v1/hcps/', params: params }

        it 'shows list of hcps' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(0)
        end
      end

      context 'without limit' do
        let(:params) { { offset: 5 } }

        before { get '/api/v1/hcps/', params: params }

        it 'shows list of hcps' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(10)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end

      context 'with offset and offset' do
        let(:params) { { limit: 5, offset: 5 } }
        
        before { get '/api/v1/hcps/', params: params }

        it 'shows list of hcps' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end
    end
  end

  # find hcps
  describe 'GET /api/v1/hcps/:id' do
    before { get "/api/v1/hcps/#{hcp_id}" }

    context 'success' do
      let(:expected_result) do
        {
          data: {
            id: hcp.id,
            name: hcp.name,
            image_path: hcp.image_path.url.to_s,
            description: hcp.description,
            speciality: {
              id: hcp.speciality.id,
              name: hcp.speciality.name,
            },
            hcfs: [],
          },
          meta: {
            status: 200
          }
        }
      end

      it 'shows hcp data' do
        response_data = JSON.parse(response.body).deep_symbolize_keys!
        expect(response.status).to eq(200)
        expect(response_data).to eq(expected_result)
      end
    end

    context 'error' do
      let(:hcp_id) { 0 }
      it 'shows not found error' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(response_data['errors']).to eq('Hcp not found')
      end
    end
  end
end
