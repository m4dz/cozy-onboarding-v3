StepView = require '../step'
_ = require 'underscore'


module.exports = class FingView extends StepView
    template: require '../templates/view_steps_fing'

    ui:
        next: '.controls .next'
        pass: '.controls .pass'

    regions:
        progression: '.progression'
        services: '.services'

    events:
        'click @ui.next': 'onSubmit'
        'click @ui.pass': 'onSubmit'


    serializeData: ->
        _.extend super,
            id: "#{@model.get 'name'}-figure"
            service: "service-logo--#{@model.get 'name'}"
            figureid: require '../../assets/sprites/fing.svg'
            edfLogo: require '../../assets/sprites/edf.svg'
            orangeLogo: require '../../assets/sprites/orange.svg'
