template = require 'templates/page/container'

Container = Backbone.View.extend

  initialize: (@options) ->
    
  render: (callback) ->
    $(@options.container).html template()

    callback?()

module.exports = Container