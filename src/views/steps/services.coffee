StepView = require '../step'
ServiceView = require './subviews/service'
_ = require 'underscore'

# Abstract class used for step presenting services, like Fing
module.exports = class ServicesStepView extends StepView
    template: require '../templates/services_step'

    ui:
        next: '.controls .next'
        pass: '.controls .pass a'
        errors: '.errors'
        services: '.services'

    regions:
        progression: '.progression'

    events:
        'click @ui.next': 'onSubmit'
        'click @ui.pass': 'onSubmit'


    onRender: (args...) ->
        super args...

        @services.forEach (slug) =>
            view = new ServiceView {
                slug: slug
                onIntentStart: () =>
                    @hideError()
                    @disableStep()
                onIntentSuccess: (doc) =>
                    @enableStep()
                    @enableNext()
                onIntentEnd: () =>
                    @enableStep()
                onIntentError: (error) =>
                    @showError 'intent service error'
                    console.error error
                    @enableStep()
            }

            @ui.services.append(view.render().$el)


    onSubmit: (event) ->
        if @stepDisabled
          event.preventDefault()
        else
          super event


    serializeData: ->
        _.extend super,
            title: @title
            id: @figure.id
            figureid: @figure.svg


    disableStep: () ->
        @stepDisabled = true


    enableStep: () ->
        @stepDisabled = false


    enableNext: () ->
        @ui.next.removeAttr('disabled')
        @ui.next.removeAttr('aria-disabled')
