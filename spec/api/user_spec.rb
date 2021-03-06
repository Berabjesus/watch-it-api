require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'create a user' do
    it 'expects to return 201' do
      post '/api/v1/users', params: {
        username: 'testuser', password: '123456', password_confirmation: '123456'
      }
      expect(response.status).to equal(201)
    end
  end

  describe 'create a user' do
    it 'expects to return 422 error' do
      post '/api/v1/users', params: {
        username: 'testuser', password: '12345678999', password_confirmation: '123456'
      }
      expect(response.status).to equal(422)
    end
  end

  describe 'Sign up' do
    it 'expects to return 202' do
      post '/api/v1/users', params: {
        username: 'testuser', password: '123456', password_confirmation: '123456'
      }
      post '/api/v1/sessions', params: {
        username: 'testuser', password: '123456'
      }
      expect(response.status).to equal(202)
    end
  end
end
