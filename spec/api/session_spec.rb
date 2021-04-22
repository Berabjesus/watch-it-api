require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'login' do
    it 'expects to return 401 error' do
      post '/api/v1/sessions', params: {
        username: 'testuser', password: '12345678999'
      }
      expect(response.status).to equal(401)
    end
  end
end
