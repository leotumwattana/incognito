require 'spec_helper'

describe MessagesController  do

  render_views

  before :each do
    @user = User.create( username: 'joe', email: 'joe@example.com', password: '1', password_confirmation: '1' )

    @event = Event.create( title: 'Junk Boat', date_time: Time.now, user: @user )

    @message = Message.create( user: @user, event: @event, content: 'Hi there')
  end

  describe 'GET index' do
    it 'returns a list of messages' do
      get :index, event_id: @event.id, :format => :json
      expect(response.status).to eq 200
      expect(JSON.load(response.body)['message']).to include {@message}
    end
  end

  describe 'POST create' do
    it 'should create message that belongs to a user' do
      post :create, event_id: @event.id, user_id: @user.id, message: { content: "Hi there" }
      expect(response.status).to be < 400
    end
  end
end
##controller tests, create messages, read message,
#model test: does the message belong to user_id and event_id