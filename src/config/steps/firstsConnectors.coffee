module.exports = {
    name: 'firstsConnectors',
    view : 'steps/firstsConnectors'
    isActive: (instance) ->
        instance.attributes \
        && instance.attributes.context \
        && (instance.attributes.context.toLowerCase() is 'maif' || instance.attributes.context.toLowerCase() is 'fing' || instance.attributes.context.toLowerCase() is 'maif_fing')
}
