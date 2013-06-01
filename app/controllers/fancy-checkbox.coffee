$ = window.jQuery

class FancyCheckbox
  el: null
  className: 'fancy-checkbox'

  constructor: (params = {}) ->
    @[property] = value for property, value of params

    el = $(@el)
    el.addClass @className
    el.on 'change', @onChange

  onChange: =>
    checked = @el.querySelector('input').checked

    el = $(@el)
    el.toggleClass 'checked', checked

module.exports = FancyCheckbox
