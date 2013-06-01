Page = require './page'
template = require '../views/eligibility'
FancyCheckbox = require './fancy-checkbox'
$ = window.jQuery

class Eligibility extends Page
  template: template

  constructor: ->
    super

    ruleBoxes = @el.querySelectorAll '.eligibility-rule'
    for ruleBox in ruleBoxes
      new FancyCheckbox el: ruleBox

    @el.addEventListener 'change', @onChange, false
    @checkEligible()

  onChange: =>
    @checkEligible()

  checkEligible: ->
    nowUnder31 = @el.querySelector('[name="nowUnder31"]').checked
    enteredUnder16 = @el.querySelector('[name="enteredUnder16"]').checked
    continuousResident = @el.querySelector('[name="continuousResident"]').checked
    unlawfulEntry = @el.querySelector('[name="unlawfulEntry"]').checked
    expiredStatus = @el.querySelector('[name="expiredStatus"]').checked
    present = @el.querySelector('[name="present"]').checked
    inSchool = @el.querySelector('[name="inSchool"]').checked
    graduated = @el.querySelector('[name="graduated"]').checked
    discharged = @el.querySelector('[name="discharged"]').checked
    felon = @el.querySelector('[name="felon"]').checked
    threat = @el.querySelector('[name="threat"]').checked

    eligible = nowUnder31 \
      and enteredUnder16 \
      and continuousResident \
      and (unlawfulEntry or expiredStatus) \
      and present \
      and (inSchool or graduated or discharged) \
      and not (felon or threat)

    el = $(@el)
    el.find('.eligible').toggle eligible
    el.find('.ineligible').toggle not eligible

module.exports = Eligibility
