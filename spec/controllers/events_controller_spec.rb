require 'spec_helper'

describe EventsController do

  render_views

  before :each do
    @user = User.create(email: 'kulio@gmail.com', password: '1234', password_confirmation: '1234')
    @junk = Event.create( title: "Junk Trip" )
    @junk.users << @user
  end

  describe 'GET index' do
    it 'returns a list of events for the user' do
      get :index, user_id: @user.id, format: :json
      expect(response.status).to eq 200
      expect(JSON.load(response.body)["events"]).to include {@junk}
    end
  end

  describe 'POST create' do
    it 'should create an event that has an owner' do
      post :create, user_id: @user.id, event: {title: "Junk Trip", date_time: "2014-05-05 00:00:00"}
      expect(response.status).to be < 400
    end
  end
end