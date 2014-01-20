View = require 'views/view'

module.exports = class Index extends View
  destroy_before: false
  el: '#test'
  template: require 'templates/test/index'