Container = require 'views/pages/container'

Router = Backbone.Router.extend

  initialize: () ->
    @container = new Container()

  routes:
    '*actions' : 'director'

  root: 'home'

  director: (@params) ->
    unless @params
      @params = @root

    console.log @params

    view = @instanciate()

    console.log view

  instanciate: () ->
    model = require "model/#{@params}"
    view = require "views/#{@params}"
    view = new view
      route: @params

    return view

module.exports = Router