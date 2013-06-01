$ = window.jQuery

class FancyCheckbox
  el: null
  className: 'fancy-checkbox'

  constructor: (params = {}) ->
    @[property] = value for property, value of params

    $(@el).addClass @className
    @el.addEventListener 'change', @onChange, false

  onChange: =>
    checked = @el.querySelector('input').checked

    el = $(@el)
    el.toggleClass 'checked', checked

module.exports = FancyCheckbox
