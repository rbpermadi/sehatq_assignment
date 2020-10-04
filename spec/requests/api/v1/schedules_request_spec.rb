require 'rails_helper'

RSpec.describe "Api::V1::Schedules", type: :request do
  let!(:schedule) { FactoryBot.create(:schedule, id: 1) }
  let(:schedule_id) { schedule.id }

  # get schedules list
  describe 'GET /api/v1/schedules' do
    describe 'success' do
      context 'shows list of schedule' do
        before { get '/api/v1/schedules/'}
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

        before { get '/api/v1/schedules/', params: params }

        it 'shows list of schedules' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(0)
        end
      end

      context 'without limit' do
        let(:params) { { offset: 5 } }

        before { get '/api/v1/schedules/', params: params }

        it 'shows list of schedules' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(10)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end

      context 'with offset and offset' do
        let(:params) { { limit: 5, offset: 5 } }
        
        before { get '/api/v1/schedules/', params: params }

        it 'shows list of schedules' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(response_data["meta"]["limit"].to_i).to eq(5)
          expect(response_data["meta"]["offset"].to_i).to eq(5)
        end
      end
    end
  end

  # find schedules
  describe 'GET /api/v1/schedules/:id' do
    before { get "/api/v1/schedules/#{schedule_id}" }

    context 'success' do
      it 'shows schedule data' do
        expect(response.status).to eq(200)
      end
    end

    context 'error' do
      let(:schedule_id) { 0 }
      it 'shows not found error' do
        response_data = JSON.parse(response.body)

        expect(response.status).to eq(404)
        expect(response_data['errors']).to eq('Schedule not found')
      end
    end
  end
end
