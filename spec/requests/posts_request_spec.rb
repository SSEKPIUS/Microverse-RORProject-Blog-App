require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) { User.create!(name: 'Peter', post_counter: 0) }

    it 'renders the index template' do
      get user_posts_path(user)
      expect(response).to render_template('index')
    end

    it 'displays a list of posts' do
      get user_posts_path(user)
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    let(:user) { User.create!(name: 'Peter', post_counter: 0) }
    let(:post) do
      user.posts.create!(title: 'Post', text: 'Body data', comments_counter: 0, likes_counter: 0, created_at: 5.day.ago)
    end

    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
    end

    it 'renders show template' do
      get user_post_path(user, post)
      expect(response).to render_template('show')
    end

    it "displays the post's title and body" do
      get '/users/1/posts/1'
      expect(response).to be_successful
      expect(response.body).to include('Here is a posts for a given user')
    end
  end
end
