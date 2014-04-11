Router = Backbone.Router.extend
  routes:
    'login':       'showLogin'

  showLogin: ->
    console.log 'test'

$ ->
  new Router()
  Backbone.history.start pushState: false