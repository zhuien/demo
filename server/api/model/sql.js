// 查询用户信息
exports.getUserInfo = id => {
  return `select * from zzz_members where uid = ${id}`
}
exports.getAllBrands = () => {
  return `select * from zzz_brands`
}
exports.getAllCategory = () => {
  return `SELECT * FROM zzz_good_category WHERE parentid = 0`
}
exports.getAllChildCategory = () => {
  return `SELECT * FROM zzz_good_category WHERE parentid != 0`
}
exports.getAllCategoryBrand = () => {
  return `SELECT * FROM zzz_good_category WHERE parentid != 0`
}
