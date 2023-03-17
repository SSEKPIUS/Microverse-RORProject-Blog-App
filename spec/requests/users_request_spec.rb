require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:user) { User.create!(name: 'Peter', post_counter: 0) }

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template('show')
    end

    it 'returns http success' do
      get user_path(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a given user')
    end
  end
end
