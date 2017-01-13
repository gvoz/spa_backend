require 'rails_helper'

describe "Posts API", type: :request do
  header = {
    "ACCEPT" => "application/json"
  }

  describe 'Create' do
    post_params = {
      'post': {
        'title': 'New post',
        'body': 'Test test test',
        'username': 'tester',
        "date": "12.01.2016"
      }
    }

    it 'should be "New post"' do
      post '/api/posts', params: post_params, headers: header
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(:ok)
      expect(Post.first.title).to eq 'New post'
    end
  end

  describe 'Index' do
    it 'sends a list of posts' do
      create_list(:post, 10)
      get '/api/posts', headers: header
      json = JSON.parse(response.body)
      # test for the 200 status-code
      expect(response).to be_success
      # check to make sure the right amount of messages are returned
      expect(json.length).to eq(10)
    end

    it 'the post attributes are the same' do
      post = create(:post)
      get '/api/posts', headers: header
      json = JSON.parse(response.body)
      expect(json.first['title']).to eq(post.title)
    end
  end

  describe 'Update' do
    let!(:post) { create(:post) }

    post_params = {
      'post': {
        'title': 'Fresh post'
      }
    }

    it 'should be "Fresh post"' do
      put "/api/posts/#{post.id}", params: post_params, headers: header
      expect(Post.find(post.id).title).to eq 'Fresh post'
    end
  end

  describe 'Delete' do
    let!(:post) { create(:post) }

    it "shouldn't any records" do
      delete "/api/posts/#{post.id}", headers: header
      expect(Post.count).to eq 0
    end
  end
end
