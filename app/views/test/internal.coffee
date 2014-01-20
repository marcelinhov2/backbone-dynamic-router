View = require 'views/view'

module.exports = class Internal extends View
  destroy_before: false
  el: '#test_internal'
  template: require 'templates/test/internal'