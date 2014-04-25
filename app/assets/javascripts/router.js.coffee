Router = Backbone.Router.extend
  routes:
    'registration': 'showRegistration'
    'login':        'showLogin'
    # 'calendar':     'showCalendar'
    'events':       'showEvents'
    'events/new':   'createEvent'

  showLogin: -> @showPage "/login", HandlebarsTemplates['session/new']
  showRegistration: -> @showPage "/registration", HandlebarsTemplates['registration/new']
  # showCalendar: -> @showPage "/calendar", HandlebarsTemplates['calendar/new']
  createEvent: (user_id) -> @showPage "../api/users/#{user_id}/events/create", HandlebarsTemplates['events/new']
  indexMessages: -> @showPage "/messages", HandlebarsTemplates['messages/index']

  showEvents: (user_id) ->
    @showEvent "/api/users/${user_id}/events", HandlebarsTemplates['events/index']


  showPage: (url, templateFunc) ->
    $.ajax url,
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        # console.log data
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




$ ->
  new Router()
  Backbone.history.start pushState: false