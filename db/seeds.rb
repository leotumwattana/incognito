User.destroy_all
Event.destroy_all

users = User.create([
  {
    username: 'joe',
    email: 'joe@example.com',
    password: '1',
    password_confirmation: '1'
  },
  {
    username: 'chloe',
    email: 'chloe@example.com',
    password: '1',
    password_confirmation: '1'
  },
  {
    username: 'ben',
    email: 'ben@example.com',
    password: '1',
    password_confirmation: '1'
  },
])

events = Event.create([
  {
    title: 'concert',
    date_time: Time.now,
    user: users[0]
  },
  {
    title: 'game',
    date_time: Time.now,
    user: users[1]
  },
])

participations = Participation.create([
  {
    user: users[0],
    event: events[0],
    status: 'red'
  },
  {
    user: users[1],
    event: events[0],
    status: 'blue'
  },
  {
    user: users[2],
    event: events[0],
    status: 'green'
  },
  {
    user: users[0],
    event: events[1],
    status: 'yellow'
  },
  {
    user: users[1],
    event: events[1],
    status: 'purple'
  },
])

messages = Message.create([
  {
    user: users[0],
    event: events[0],
    content: 'Hi there'
  },
  {
    user: users[1],
    event: events[0],
    content: 'User 1 checking in'
  },
  {
    user: users[0],
    event: events[0],
    content: 'Still here bro'
  },
  {
    user: users[2],
    event: events[1],
    content: 'Anyone there?'
  },
  {
    user: users[1],
    event: events[1],
    content: 'Yolo'
  },
])

stats = Stat.create([
  {
    user: users[0],
    points: 5
  },
  {
    user: users[0],
    points: 3
  },
  {
    user: users[0],
    points: 7
  },
  {
    user: users[0],
    points: 4
  },
  {
    user: users[0],
    points: 3
  },
  {
    user: users[0],
    points: 6
  },

])

tasks = Task.create([
  {
    event: events[0],
    name: "Do that thing",
    users: [ users[0], users[2] ]
  },
  {
    event: events[0],
    name: "Do another thing",
    users: [ users[0] ]
  },
  {
    event: events[1],
    name: "Get up",
    users: users
  },
  {
    event: events[1],
    name: "Get out",
    users: [ users[0], users[1] ]
  },
  {
    event: events[1],
    name: "Get over it",
    users: [ users[1] ]
  }
])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
