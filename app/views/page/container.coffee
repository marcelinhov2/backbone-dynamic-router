View = require 'views/view'
template = require 'templates/page/container'

module.exports = class Container extends View
  el: '#wrap'
  template: require 'templates/page/container'