View = require 'views/view'

module.exports = class Index extends View
  destroy_before: true
  el: '#home'
  template: require 'templates/home/index'