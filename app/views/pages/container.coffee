template = require 'templates/container'

Container = Backbone.View.extend

  initialize: (options) ->
    @render()

  render: () ->
    $('body').html template()

module.exports = Container