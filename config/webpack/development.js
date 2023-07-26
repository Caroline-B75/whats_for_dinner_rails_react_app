process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

environment.config.devServer = { 
    hot: true, // cette ligne
    ...environment.config.devServer
}

module.exports = environment.toWebpackConfig()
