// var homeController = require('./home')
var userController = require('./user')
var goodController = require('./good')

exports.getInfo = userController.getInfo
exports.getAllBrands = goodController.getAllBrands
exports.getAllCategory = goodController.getAllCategory
exports.getAllChildCategory = goodController.getAllChildCategory
