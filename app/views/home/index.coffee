template = require 'templates/home/index'

Index = Backbone.View.extend

  initialize: (@options) ->
    console.log @options

    console.log 'views/home/index'

module.exports = Index