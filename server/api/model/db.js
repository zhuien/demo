var mysql = require('mysql')
var setting = require('./setting.js')

// 数据库配置
var option = {
  host: setting.host,
  user: setting.user,
  password: setting.password,
  port: setting.port,
  database: setting.database,
  connectionLimit: setting.connectionLimit
}
// 数据库连接池
var pool = mysql.createPool(option)
/**
 * select和delete操作
 * @param  {string}   sql      sql语句
 * @param  {Function} callback 回调函数
 * @return {none}
 * */
const __selsctDelete = function (sql, callback) {
  pool.getConnection(function (err, conn) {
    if (err) {
      console.log('CONNECT ERROR:', err.message)
      callback(err, null, null)
    } else {
      conn.query(sql, function (err, rows, fields) {
        // 释放连接
        conn.release()
        // 事件驱动回调
        callback(err, rows, fields)
      })
    }
  })
}

/**
 * update和insert操作
 * @param  {string}   sql      sql语句
 * @param  {array}    params   参数数组
 * @param  {Function} callback 回调函数
 * @return {none}
 */
const __updateInsert = function (sql, params, callback) {
  pool.getConnection(function (err, conn) {
    if (err) {
      console.log('CONNECT ERROR:', err.message)
      callback(err, null, null)
    } else {
      conn.query(sql, params, function (err, rows, fields) {
        // 释放连接
        conn.release()
        // 事件驱动回调
        callback(err, rows, fields)
      })
    }
  })
}
/**
 * query函数重载
 * @return {none}
 */
exports.query = function () {
  var length = arguments.length
  var sql = ''
  var cb = ''
  console.log(arguments.length)
  if (length === 2) {
    sql = arguments[0]
    cb = arguments[1]
    __selsctDelete(sql, cb)
  } else if (length === 3) {
    sql = arguments[0]
    var params = arguments[1]
    cb = arguments[2]
    __updateInsert(sql, params, cb)
  } else {
    console.log('ERROR:', '参数不对呀')
  }
}
