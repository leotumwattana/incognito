# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Event.destroy_all
Message.destroy_all

@kulio = User.create({ username: "Kulio", email: "kulio@gmail.com", password: "123", password_confirmation: "123" })
@mark = User.create({ username: "Mark", email: "mark@gmail.com", password: "123", password_confirmation: "123" })
@nigel = User.create({ username: "Nigel", email: "nigel@gmail.com", password: "123", password_confirmation: "123" })

@junk_trip = Event.create({title: "Junk Trip", date_time: "2014-04-28 13:00:00"})
Event.create({title: "Some other event", date_time: "2014-04-29 10:00:00"})
Event.create({title: "Thailand Trip", date_time: "2014-04-29 16:00:00"})
Event.create({title: "WDI Seafood Trip", date_time: "2014-04-30 18:00:00"})
Event.create({title: "Some other event", date_time: "2014-05-29 10:00:00"})
Event.create({title: "Thailand Trip", date_time: "2014-05-29 16:00:00"})
Event.create({title: "WDI Seafood Trip", date_time: "2014-05-30 18:00:00"})

Message.create({event_id: @junk_trip.id, user_id: @kulio.id, content: "Let's go on a junk trip!"})
Message.create({event_id: @junk_trip.id, user_id: @nigel.id, content: "Sounds good!"})
Message.create({event_id: @junk_trip.id, user_id: @mark.id, content: "I'll cook the food. ;)"})
