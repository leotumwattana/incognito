require 'spec_helper'

describe EventsController do

  render_views

  before :each do
    @user = User.create(email: 'kulio@gmail.com', password: '1234', password_confirmation: '1234')
    @junk = Event.create( title: "Junk Trip" )
    @junk.users << @user
  end

  describe 'GET index' do
    it 'should not drive me crazy' do
      expect(true).to eq true
    end
    it 'returns a list of events for the user' do
      get :index, user_id: @user.id, format: :json
      expect(response.status).to eq 200
      expect(JSON.load(response.body)["events"]).to include @junk
    end
  end
end