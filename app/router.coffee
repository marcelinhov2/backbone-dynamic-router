Container = require 'views/page/container'

Router = Backbone.Router.extend

  current_view: null
  first_load: false

  initialize: () ->
    container = new Container
      model: if ContainerModel? then ContainerModel
      el: 'body'

    unless container.model
      container.render( => 
        @first_load = true
      )

  routes:
    '*actions' : 'director'

  root: 'home'

  director: (@params) ->
    @mount_require_url()

    setTimeout ( =>
      if @first_load
        # console.log @current_view

        view = @instanciate()
        @current_view = view

        view.render()
    ), 100

  mount_require_url: ->
    unless @params
      @params = @root

    splited_route = @params.split('/')

    @require_url = @params

    unless splited_route[1]?
      @require_url = "#{splited_route[0]}/index"

  instanciate: () ->
    model = require "models/#{@require_url}"
    view  = require "views/#{@require_url}"
    
    view = new view
      model: model
      route: @params
      el: '#container'

    return view

module.exports = Router