emailHelper = require '../../lib/email_helper'


# local function to validate email
isValidEmail = (email) ->
    return emailHelper.validate email


module.exports = {
    name: 'infos',
    view : 'steps/infos',
    isActive: (instance) ->
        validation = @validate instance.attributes
        return not validation.success


    getData: () ->
        return \
            public_name: @publicName,
            email: @email


    fetchData: (instance) ->
        return Promise.resolve @ unless instance.attributes

        @publicName = instance.attributes.public_name
        @email = instance.attributes.email

        return Promise.resolve @


    # @see Onboarding.validate
    validate: (data) ->
        validation = success: false, errors: []

        ['public_name', 'email'].forEach (field) ->
            if typeof data[field] is 'undefined' \
                    or data[field].trim().length is 0
                validation.errors[field] = "missing #{field}"

        if data.email and not isValidEmail(data.email)
            validation.errors['email'] = 'invalid email format'

        validation.success = Object.keys(validation.errors).length is 0

        return validation


}
