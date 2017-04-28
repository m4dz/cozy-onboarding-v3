ServicesStepView = require './services'


module.exports = class MaifView extends ServicesStepView

    title: 'step maif title'

    figure:
        id: 'maif-figure'
        svg: require '../../assets/sprites/maif.svg'

    services: ['maif']
