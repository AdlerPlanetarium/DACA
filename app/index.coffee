t7e = require 't7e'
enUs = require './lib/en-us'
t7e.load enUs

Navigable = require 'navigable'
Home = require './controllers/home'
Eligibility = require './controllers/eligibility'
Resources = require './controllers/resources'
Map = require './controllers/map'

stack = Navigable.stack [
  {'Home': new Home}
  {'Eligibility': new Eligibility}
  {'Resources': new Resources}
  {'Map': new Map}
]

document.body.appendChild stack.el
