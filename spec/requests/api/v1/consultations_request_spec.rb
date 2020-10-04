require 'rails_helper'

RSpec.describe "Api::V1::Consultations", type: :request do
  let!(:consultation) { FactoryBot.create(:consultation, id: 1) }
  let(:consultation_id) { consultation.id }
  let(:user) { FactoryBot.create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  # get consultations list
  describe 'GET /api/v1/consultations' do
    describe 'success' do
      context 'shows' do
        before { 
          get '/api/v1/consultations/',
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          }
        }
        
        it 'list of consultation' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(200)
        end
      end
    end

    describe 'error' do
      context 'not authorized user' do
        before { get '/api/v1/consultations/'}
        it 'show status 401' do
          response_data = JSON.parse(response.body)

          expect(response.status).to eq(401)
        end
      end
    end
  end

  # find consultations
  describe 'GET /api/v1/consultations/:id' do
    describe 'success' do
      context 'shows' do
        before { 
          get "/api/v1/consultations/#{consultation_id}",
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          }
        }
        
        it ' schedule data' do
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'error' do
      context 'not authorized user' do
        before { get '/api/v1/consultations/'}
        it 'show status 401' do
          expect(response.status).to eq(401)
        end
      end
      context 'not found' do
        before { 
          get "/api/v1/consultations/0",
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          }
        }
        it 'show status 404' do
          expect(response.status).to eq(404)
        end
      end
    end
  end

  # create consultations
  describe 'POST /api/v1/consultations/' do
    describe 'success' do
      let(:schedule) { FactoryBot.create(:schedule, day: DateTime.tomorrow.strftime("%a").downcase) }
      context 'shows' do
        before { 
          post "/api/v1/consultations/",
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          },
          params: {
            consultation: {
              schedule_id: schedule.id,
              date: DateTime.tomorrow.strftime("%Y-%m-%d")
            }
          }.to_json
        }
        
        it ' status 201' do
          expect(response.status).to eq(201)
        end
      end
    end

    describe 'error' do
      context 'not authorized user' do
        before { post '/api/v1/consultations/'}
        it 'show status 401' do
          expect(response.status).to eq(401)
        end
      end
    end
  end
end
