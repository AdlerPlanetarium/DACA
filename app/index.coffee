t7e = require 't7e'
enUs = require './lib/en-us'
t7e.load enUs

Navigable = require 'navigable'
Home = require './controllers/home'
Eligibility = require './controllers/eligibility'
Map = require './controllers/map'

stack = Navigable.stack [
  {'Home': new Home}
  {'Eligibility': new Eligibility}
  {'Map': new Map}
]

document.body.appendChild stack.el
