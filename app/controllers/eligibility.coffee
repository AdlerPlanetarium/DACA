Page = require './page'

class Eligibility extends Page
  isElligible: ->
    nowUnder31 = false
    enteredUnder16 = false
    continuousResident = false
    unlawfulEntry = false
    expiredStatus = false
    present = false
    inSchool = false
    graduated = false
    discharged = false
    felon = false
    threat = false

    return nowUnder31 \
      and enteredUnder16 \
      and continuousResident \
      and (unlawfulEntry or expiredStatus) \
      and present \
      and (inSchool or graduated or discharged) \
      and not (felon or threat)

module.exports = Eligibility
