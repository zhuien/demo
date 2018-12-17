var express = require('express')
const myrouter = require('./router.js')
var router = express.Router()
// 获取用户信息
router.get('/getInfo', myrouter.getInfo)
router.get('/getAllBrands', myrouter.getAllBrands)
router.get('/getAllCategory', myrouter.getAllCategory)

module.exports = router
