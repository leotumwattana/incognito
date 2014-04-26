Router = Backbone.Router.extend
  routes:
    'registration':   'showRegistration'
    'login':          'showLogin'
    'calendar':       'showCalendar'
    'event/:id':      'indexMessages'
    'events':         'showEvents'
    'events/create':  'createEvent'
    'events/new':     'newEvent'

  showLogin: -> @showPage "/login", HandlebarsTemplates['session/new']
  showRegistration: -> @showPage "/registration", HandlebarsTemplates['registration/new']
  indexMessages: (event_id) -> @showPage "http://localhost:3000/api/events/#{event_id}/messages", HandlebarsTemplates['messages/index']

  createEvent: (user_id) -> @showPage "../api/users/#{user_id}/events/create"

  showEvents: (user_id) ->
    @showEvent "/api/users/${user_id}/events", HandlebarsTemplates['events/index']

  newEvent: -> @showPage " ", HandlebarsTemplates['events/new']


  # THE NESTED FUNCTIONS CALLED BY ABOVE

  showPage: (url, templateFunc) ->
    $.ajax url,
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $('body').html(templateFunc(data))
      error: (x,y,z) ->
        console.log x,y,z
        $('body').html(templateFunc(data))

  showEvent: (url, templateFunc) ->
    $.ajax url,
      type: 'GET'
      dataType: 'json'
      success: (data) ->

        d = new Date()
        # console.log data
        goodData = {events:[]}

        for e in data.events
          if parseInt(e.date_time[6]) == (d.getMonth() + 1)
            e.date_time = moment(e.date_time).format('MMMM Do YYYY');
            goodData.events.push(e)
        # console.log goodData
        $('body').html(templateFunc(goodData))

      error: (x,y,z) ->
        console.log x,y,z
        $('body').html(templateFunc(goodData))





$(document).ready ->
  new Router()
  Backbone.history.start pushState: false