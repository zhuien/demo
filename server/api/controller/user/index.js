const db = require('../../model/db.js')
const sql = require('../../model/sql.js')
var URL = require('url')

exports.getInfo = (req, res, next) => {
  var params = URL.parse(req.url, true).query
  //   res.send(sql.getUserInfo(params.id))
  db.query(sql.getUserInfo(params.id), (err, rows, fields) => {
    if (err) {
      throw err
    }
    res.send(rows)
  })
}
