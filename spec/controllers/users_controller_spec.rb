require 'spec_helper'

describe UsersController do

  render_views

  before :each do
    @user = User.create(username: 'kulio', email: 'kulio@gmail.com', password: '1234', password_confirmation: '1234')
  end



  describe 'GET index' do
    it 'returns a list of users' do
      get :index, :format => :json
      expect(response.status).to eq 200
      expect(response.body).to include 'kulio@gmail.com'
      expect(JSON.load(response.body)["users"][0]["email"]).to eq 'kulio@gmail.com'
    end
  end

  describe 'GET show' do
    it 'returns one user' do
      get :show, id: @user.id, :format => :json
      expect(response.status).to eq 200
      expect(response.body).to include 'kulio@gmail.com'
      expect(JSON.load(response.body)["email"]).to eq 'kulio@gmail.com'

    end
  end

end