Container = require 'views/page/container'

Router = Backbone.Router.extend

  current_view: null
  first_load: false

  initialize: () ->
    container = new Container
      model: if ContainerModel? then ContainerModel
      container: '.root-view'

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

    @interval = setInterval ( ->
      self.stage_manager()
    ), 100

  stage_manager: ->
    if @first_load

      if @current_view
        # Destroy the screen, and them render another one
        
        if @current_view.destroy_before
          @current_view.out(=>
            view = @render_view( @ )
            @current_view = view  
          )
        else
          view = @render_view( @ )
          @current_view.out(=>
            @current_view = view
          )

      else
        view = @render_view( @ )
        @current_view = view  

      clearInterval @interval

  render_view: (scope) ->
    view = scope.instanciate()

    view.render()
    return view

  mount_require_url: ->
    unless @params
      @params = @root

    splited_route = @params.split('/')

    @require_url = @params

    unless splited_route[1]?
      @require_url = "#{splited_route[0]}/index"

  instanciate: () ->
    try
      model = require "models/#{@require_url}"
      view  = require "views/#{@require_url}"
      
      view = new view
        model: model
        route: @params
        container: '#container'

      return view

    clearInterval @interval
    throw new Error("This is not an error. This is just to abort javascript")

module.exports = Router