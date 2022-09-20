require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  context 'GET /id' do
    it 'returns http success' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:success)
    end

    it 'should render index template' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end

    it 'should render correct text' do
      get user_posts_path(1)
      expect(response.body).to include('Posts#id')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:success)
    end

    it 'should render show template' do
      get user_post_path(1, 2)
      expect(response).to render_template(:show)
    end

    it 'should render correct text' do
      get user_post_path(1, 2)
      expect(response.body).to include('These are the posts')
    end
  end
end
