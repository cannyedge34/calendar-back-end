# spec/requests/events_spec.rb
require 'rails_helper'

RSpec.describe 'Requests API', type: :request do
  # initialize test data
  let!(:events) { create_list(:event, 10) }

  # Test suite for GET /events
  describe 'GET /events' do
    # make HTTP get request before each example
    before { get '/events' }

    it 'returns events' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for POST /events
  describe 'POST /events' do
    # valid payload
    let(:valid_attributes) { {title: 'Learn Vue', start_date: Time.zone.now} }

    context 'when the request is valid' do
      before { post '/events', params: valid_attributes }

      it 'creates a event' do
        expect(json['title']).to eq('Learn Vue')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/events', params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to eq(
          '{"message":"Validation failed: Title can\'t be blank, Start date can\'t be blank"}'
        )
      end
    end
  end
end
