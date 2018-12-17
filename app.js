var path = require('path')
var bodyParser = require('body-parser')
var express = require('express')
var app = express()

var index = require('./server/controller/home/index')
var test = require('./server')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use('/api', index)
app.use('/test', test)

app.listen(3366, () => {
  console.log('3366')
})
