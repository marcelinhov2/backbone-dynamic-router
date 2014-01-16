Container = require 'views/page/container'

Router = Backbone.Router.extend

  current_view: null
  first_load: false

  initialize: () ->
    container = new Container
      model: if ContainerModel? then ContainerModel
      el: '.root-view'

    unless container.model
      container.render( =>
        @first_load = true
      )

  routes:
    '*actions' : 'director'

  root: 'home'

  director: (@params) ->
    self = @

    @mount_require_url()

    interval = setInterval ( ->
      if self.first_load
        if self.current_view
          self.current_view.out(->
            self.render_view( self )
          )
        else
          self.render_view( self )

        clearInterval interval
        
    ), 100

  render_view: (scope) ->
    view = scope.instanciate()
    scope.current_view = view

    view.render()

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