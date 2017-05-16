# List of onboarding steps.
# Every steps are in the same file now, but the idea is to
# At this time there is only proper
fing = require './fing'
welcome = require './welcome'
agreement = require './agreement'
password = require './password'
infos = require './infos'
accounts = require './accounts'
confirmation = require './confirmation'

module.exports = [
    password,
    infos,
    fing
]
