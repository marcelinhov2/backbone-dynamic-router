module.exports = class View extends Backbone.View.extend

  constructor: (@options) ->
    # console.log @options

  render: (callback) ->
    $(@options.el).html @template()

    callback?()