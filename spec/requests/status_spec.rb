# frozen_string_literal: true

require 'rails_helper'

describe 'get all courses', type: :request do
  let!(:courses) { FactoryBot.create_list(:course, 20) }
  before { get '/api/v1/courses' }
  it 'returns all courses' do
    expect(JSON.parse(response.body).size).to eq(20)
  end
  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end

describe 'post a User', type: :request do
  before do
    post '/api/v1/users', params: {
      username: 'user1',
      email: 'user1@hotmail.com',
      password: 'foobar',
      password_confirmation: 'foobar'
    }
  end
  it 'returns the user' do
    expect(JSON.parse(response.body)['username']).to eq('user1')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end

describe 'Unauthorized request', type: :request do
  before do
    get '/api/v1/favourites'
  end

  it 'it returns empty when not passed a token' do
    expect(response.body).to eql('')
  end
end

describe 'Getting Favourites', type: :request do
  before do
    favourite = FactoryBot.create(:favourite)
    post '/api/v1/user_token', params: { auth: { email: favourite.user.email, password: favourite.user.password } }
    token = JSON.parse(response.body)['jwt']
    get '/api/v1/favourites', headers: { Authorization: "Bearer #{token}" }
  end

  it 'gets favourites when logged in' do
    courses = JSON.parse(response.body)
    expect(courses.size).to be >= 1
  end
end
