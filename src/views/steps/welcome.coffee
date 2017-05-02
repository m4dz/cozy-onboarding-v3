_ = require 'underscore'
StepView = require '../step'


FORMS_DIS_ELEMENTS = [
    'button'
    'command'
    'fieldset'
    'input'
    'keygen'
    'optgroup'
    'option'
    'select'
    'textarea'
]


module.exports = class WelcomeView extends StepView
    template: require '../templates/view_steps_welcome'

    serializeData: ->
        _.extend super,
            link:     'https://cozy.io'
            id: "#{@model.get 'name'}-figure"
            figureid: require '../../assets/sprites/illustration-welcome.svg'
