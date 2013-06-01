class Page
  el: null
  className: 'page'
  tag: 'div'
  template: null

  constructor: (params = {}) ->
    @[property] = value for property, value of params

    @el ?= document.createElement @tag
    @el.className = @className
    @el.innerHTML = if typeof @template is 'function'
      @template @
    else if typeof @template is 'string'
      @template

module.exports = Page
