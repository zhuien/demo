const db = require('../../model/db.js')
const sql = require('../../model/sql.js')
// var URL = require('url')

exports.getAllBrands = (req, res, next) => {
//   var params = URL.parse(req.url, true).query
  //   res.send(sql.getUserInfo(params.id))
  db.query(sql.getAllBrands(), (err, rows, fields) => {
    if (err) {
      throw err
    }
    res.send(rows)
  })
}
exports.getAllCategory = (req, res, next) => {
  var promise = new Promise((resolve, reject) => {
    db.query(sql.getAllCategory(), (err, rows, fields) => {
      if (err) {
        reject(err)
      }
      resolve(rows)
    })
  })
  promise.then((rows) => {
    let data = {}
    data.categoryOne = rows
    db.query(sql.getAllChildCategory(), (err, rows, fields) => {
      if (err) {
        throw err
      }
      data.categoryTow = rows
      res.json(data)
    })
  })
}
