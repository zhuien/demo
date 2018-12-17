
var bodyParser = require('body-parser')
var express = require('express')
var api = require('./api')
var app = express()
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use('/api', api)

app.listen(3366, () => {
  console.log('3366')
})
