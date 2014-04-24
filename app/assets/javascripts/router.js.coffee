Router = Backbone.Router.extend
  routes:
    'registration': 'showRegistration'
    'login':        'showLogin'
    'calendar':     'showCalendar'
    'event/:id':    'indexMessages'

  showLogin: -> @showPage "/login", HandlebarsTemplates['session/new']
  showRegistration: -> @showPage "/registration", HandlebarsTemplates['registration/new']
  showCalendar: -> @showPage "/calendar", HandlebarsTemplates['calendar/new']

  indexMessages: (event_id) -> @showPage "http://localhost:3000/api/events/#{event_id}/messages", HandlebarsTemplates['messages/index']

  showPage: (url, templateFunc) ->
    $.ajax url,
      type: 'GET'
      data: 'json'
      success: (data) ->
        console.log(data)
        $('body').html(templateFunc(data))
      error: (x,y,z) ->
        console.log x,y,z
        $('body').html(templateFunc())


$(document).ready ->
  new Router()
  Backbone.history.start pushState: false