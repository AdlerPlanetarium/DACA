t7e = require 't7e'
enUs = require './lib/en-us'
t7e.load enUs

Navigable = require 'navigable'
Home = require './controllers/home'
Eligibility = require './controllers/eligibility'

stack = Navigable.stack [
  {'Home': new Home}
  {'Eligibility': new Eligibility}
]

document.body.appendChild stack.el
