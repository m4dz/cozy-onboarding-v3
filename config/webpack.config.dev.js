'use strict'

const webpack = require('webpack')

module.exports = {
  devtool: '#source-map',
  externals: ['cozy'],
  plugins: [
    new webpack.DefinePlugin({
      __SERVER__: JSON.stringify('http://app.cozy.tools'),
      __STACK_ASSETS__: false,
      __PIWIK_TRACKER_URL__: JSON.stringify('https://piwik.cozycloud.cc/piwik.php'),
      __PIWIK_SITEID__: 11
    }),
    new webpack.ProvidePlugin({
      'cozy.client': 'cozy-client-js/dist/cozy-client.js'
    })
  ]
}
