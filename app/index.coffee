t7e = require 't7e'
enUs = require './lib/en-us'
t7e.load enUs

Navigable = require 'navigable'
Home = require './controllers/home'

stack = Navigable.stack [
  {'Home': new Home}
]

document.body.appendChild stack.el
