object false
child @messages, :root => "messages" do
  attributes :id, :event_id, :user_id, :content
  child :user do
    attributes :id, :username, :email

    node :href do |user|
      user_url(user)
    end
  end

  child :event do
    attributes :id, :title, :date_time

    node :href do |event|
      event_url(event)
    end
  end

  node :href do |messages|
    event_messages_url(messages)
  end

end