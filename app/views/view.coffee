module.exports = class View extends Backbone.View.extend

  constructor: (@options) ->
    # console.log @options

  before_render: ->
    # console.log 'before_render'

  render: (after_render) ->
    @before_render?()

    $(@options.container).prepend @template()

    @after_render?()

    @in after_render

  after_render: ->
    # console.log 'after_render'

  before_in: ->
    # console.log 'before_in'

  in: (callback) ->
    @before_in?()

    $(@el).fadeIn( => 
      @after_in?()

      callback?()
    )

  after_in: ->
    # console.log 'after_in'
    # console.log '*********************'

  before_out: ->
    # console.log 'before_out'
  
  out: (callback) ->
    @before_out?()

    $(@el).fadeOut( => 
      @after_in?()

      @destroy callback
    )

  after_out: ->
    # console.log 'after_out'

  before_destroy: ->
    # console.log 'before_destroy'
  
  destroy: (callback) ->
    @before_detroy?()

    $(@el).remove()
    
    @after_destroy?()

    callback?()

  after_destroy: ->
    # console.log 'after_destroy'