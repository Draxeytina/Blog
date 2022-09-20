require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /id' do
    it 'returns http success' do
      get '/users/id'
      expect(response).to have_http_status(:success)
    end

    it 'should render index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'should render text in template' do
      get users_path
      expect(response.body).to include('Users#id')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end

    it 'should render show template' do
      get user_path(1)
      expect(response).to render_template(:show)
    end

    it 'should render correct text in template' do
      get user_path(1)
      expect(response.body).to include('Here are the users')
    end
  end
end
