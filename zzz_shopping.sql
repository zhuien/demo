/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : zzz_shopping

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 31/10/2018 22:14:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zzz_app_menus
-- ----------------------------
DROP TABLE IF EXISTS `zzz_app_menus`;
CREATE TABLE `zzz_app_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `isshow` int(1) NULL DEFAULT 0,
  `type` int(11) NULL DEFAULT NULL COMMENT '1底部 2首页',
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_app_slides
-- ----------------------------
DROP TABLE IF EXISTS `zzz_app_slides`;
CREATE TABLE `zzz_app_slides`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slide_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序小到大',
  `isshow` int(1) NULL DEFAULT NULL COMMENT '是否显示',
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_business
-- ----------------------------
DROP TABLE IF EXISTS `zzz_business`;
CREATE TABLE `zzz_business`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `business_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺图标',
  `shopkeeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '掌柜名',
  `business_licence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `operating_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营地区',
  `operating_type` int(11) NULL DEFAULT NULL COMMENT '经营类型',
  `detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `browse_num` int(11) NULL DEFAULT NULL COMMENT '浏览数',
  `follow_num` int(11) NULL DEFAULT 0 COMMENT '关注数',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_business_apply
-- ----------------------------
DROP TABLE IF EXISTS `zzz_business_apply`;
CREATE TABLE `zzz_business_apply`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `business_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺图标',
  `shopkeeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '掌柜名',
  `business_licence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `operating_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经营地区',
  `operating_type` int(11) NULL DEFAULT NULL COMMENT '经营类型',
  `detail_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `lng` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纬度',
  `browse_num` int(11) NULL DEFAULT NULL COMMENT '浏览数',
  `follow_num` int(11) NULL DEFAULT 0 COMMENT '关注数',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(2) NULL DEFAULT NULL COMMENT '1通过 0未审核 -1不通过',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家申请' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_business_discount
-- ----------------------------
DROP TABLE IF EXISTS `zzz_business_discount`;
CREATE TABLE `zzz_business_discount`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `couponid` int(11) NULL DEFAULT NULL,
  `business_id` int(11) NULL DEFAULT NULL,
  `goodid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家优惠' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_business_statistics
-- ----------------------------
DROP TABLE IF EXISTS `zzz_business_statistics`;
CREATE TABLE `zzz_business_statistics`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `follower` int(11) NOT NULL COMMENT '关注数',
  `comprehensive` int(11) NULL DEFAULT NULL COMMENT '综合体验',
  `praise_rate` double(3, 1) NULL DEFAULT NULL COMMENT '好评率',
  `desc_consistent` double(3, 1) NULL DEFAULT NULL COMMENT '描述相符',
  `service_attitude` double(3, 1) NULL DEFAULT NULL COMMENT '服务态度',
  `logistics_service` double(3, 1) NULL DEFAULT NULL COMMENT '物流服务',
  `daily_sales` int(11) NULL DEFAULT NULL COMMENT '日销量',
  `weekly_sales` int(11) NULL DEFAULT NULL COMMENT '周销量',
  `monthly_sales` int(11) NULL DEFAULT NULL COMMENT '月销量',
  `quarterly_sales` int(11) NULL DEFAULT NULL COMMENT '季销量',
  `annual_sales` int(11) NULL DEFAULT NULL COMMENT '年销量',
  PRIMARY KEY (`id`, `business_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家数据统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_coupon
-- ----------------------------
DROP TABLE IF EXISTS `zzz_coupon`;
CREATE TABLE `zzz_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NULL DEFAULT NULL,
  `coupon_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `coupon_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `discount_price` double(10, 2) NULL DEFAULT NULL COMMENT '优惠价格',
  `discount_conditions` double(10, 2) NULL DEFAULT NULL COMMENT '优惠条件',
  `statrtime` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `coupon_stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `limitednum` int(11) NULL DEFAULT NULL COMMENT '限定个人领取数',
  `coupon_stat` int(11) NULL DEFAULT NULL COMMENT '状态',
  `coupont_type` int(1) NULL DEFAULT NULL COMMENT '1商品 2店铺',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_coupon_record
-- ----------------------------
DROP TABLE IF EXISTS `zzz_coupon_record`;
CREATE TABLE `zzz_coupon_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `couponid` int(11) NULL DEFAULT NULL,
  `createtime` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券领取' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_good_comments
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_comments`;
CREATE TABLE `zzz_good_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` int(11) NULL DEFAULT NULL,
  `grade_comment` int(1) NULL DEFAULT NULL COMMENT '评论等级',
  `uid` int(11) NULL DEFAULT NULL COMMENT '评论人',
  `comment_content` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `comment_thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论图片',
  `parentsid` int(11) NULL DEFAULT NULL COMMENT '父评论id',
  `browsenum` int(11) NULL DEFAULT NULL COMMENT '浏览数',
  `givenum` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `comment_num` int(11) NULL DEFAULT NULL COMMENT '评论数',
  `comment_time` int(11) NULL DEFAULT NULL COMMENT '评论时间',
  `iscomment` int(1) NULL DEFAULT NULL COMMENT '1是 2否',
  `ishide` int(1) NULL DEFAULT NULL COMMENT '1是 2否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_good_orders
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_orders`;
CREATE TABLE `zzz_good_orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `goodid` int(11) NOT NULL,
  `totalprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `freight_risk` double(10, 2) NULL DEFAULT NULL COMMENT '运费险',
  `freight` double(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `real_payment` double(10, 2) NULL DEFAULT NULL COMMENT '实付',
  `ordernum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `tradenum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交易号',
  `couriernum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `backintegral` int(11) NULL DEFAULT NULL COMMENT '返积分',
  `tradestat` int(11) NULL DEFAULT NULL COMMENT '交易状态',
  `tranclosure_reasons` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关闭交易原因',
  `isdel` int(1) NULL DEFAULT NULL COMMENT '是否删除',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `payment_time` int(11) NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` int(11) NULL DEFAULT NULL COMMENT '发货时间',
  `transaction_time` int(11) NULL DEFAULT NULL COMMENT '成交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_good_params
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_params`;
CREATE TABLE `zzz_good_params`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NULL DEFAULT NULL,
  `goodid` int(11) NULL DEFAULT NULL,
  `params_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数标题',
  `params_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_good_quesans
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_quesans`;
CREATE TABLE `zzz_good_quesans`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NULL DEFAULT NULL,
  `goodid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL COMMENT '问答人',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '问答内容',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '问答时间',
  `concernnum` int(11) NULL DEFAULT NULL COMMENT '关注问题数',
  `userfulnum` int(11) NULL DEFAULT NULL COMMENT '点击有用数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品问答' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_good_sku
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_sku`;
CREATE TABLE `zzz_good_sku`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NULL DEFAULT NULL,
  `goodid` int(11) NULL DEFAULT NULL,
  `specid1` int(11) NULL DEFAULT NULL,
  `specid2` int(11) NULL DEFAULT NULL COMMENT '规格1',
  `specid3` int(11) NULL DEFAULT NULL COMMENT '规格2',
  `good_stock` int(11) NULL DEFAULT NULL COMMENT '规格3',
  `good_current_price` double(10, 2) NULL DEFAULT NULL COMMENT '现价',
  `good_low_price` double(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `ispromotion` int(1) NULL DEFAULT NULL COMMENT '是否促销',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_good_spec
-- ----------------------------
DROP TABLE IF EXISTS `zzz_good_spec`;
CREATE TABLE `zzz_good_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NULL DEFAULT NULL,
  `goodid` int(11) NULL DEFAULT NULL,
  `spec_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格标题',
  `spec_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格描述',
  `spec_stat` int(11) NULL DEFAULT NULL COMMENT '1 2 3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_goods
-- ----------------------------
DROP TABLE IF EXISTS `zzz_goods`;
CREATE TABLE `zzz_goods`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL COMMENT '店铺id',
  `classifi_id` int(11) NOT NULL COMMENT '分类id',
  `good_title` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '标题',
  `good_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `good_current_price` double(10, 2) NULL DEFAULT NULL COMMENT '基本现价',
  `good_low_price` double(10, 2) NULL DEFAULT NULL COMMENT '基本原价',
  `good_pay_num` int(11) NULL DEFAULT 0 COMMENT '付款数',
  `good_keys` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `good_freight` double(10, 2) NULL DEFAULT NULL COMMENT '运费',
  `good_stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `good_paytotalnum` int(11) NULL DEFAULT 0 COMMENT '一个人购买次数',
  `good_apaynum` int(11) NULL DEFAULT 0 COMMENT '一次购买数量',
  `good_grounding` int(11) NULL DEFAULT 0 COMMENT '是否上架',
  `good_createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `good_updatetime` int(11) NULL DEFAULT NULL COMMENT '修改时间',
  `good_uptime` int(11) NULL DEFAULT NULL COMMENT '上架时间',
  `good_distime` int(11) NULL DEFAULT NULL COMMENT '下架时间',
  `good_describe` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述，详情',
  `good_backintegral` int(11) NULL DEFAULT NULL COMMENT '返积分',
  `good_monthlysales` int(11) NULL DEFAULT NULL COMMENT '月销量',
  `good_totalsales` int(11) NULL DEFAULT NULL COMMENT '总销量',
  `collectnum` int(11) NULL DEFAULT NULL COMMENT '收藏数',
  `browsenum` int(11) NULL DEFAULT NULL COMMENT '浏览数',
  PRIMARY KEY (`gid`, `business_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_goods_thumb
-- ----------------------------
DROP TABLE IF EXISTS `zzz_goods_thumb`;
CREATE TABLE `zzz_goods_thumb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodid` int(11) NOT NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `isshow` int(11) NULL DEFAULT NULL COMMENT '1是 2否',
  PRIMARY KEY (`id`, `goodid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_member_deliveryaddress
-- ----------------------------
DROP TABLE IF EXISTS `zzz_member_deliveryaddress`;
CREATE TABLE `zzz_member_deliveryaddress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `delivery_mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货地区',
  `delivery_address_detail` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细收货地址',
  PRIMARY KEY (`id`, `uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for zzz_member_footprint
-- ----------------------------
DROP TABLE IF EXISTS `zzz_member_footprint`;
CREATE TABLE `zzz_member_footprint`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `browsetime` int(11) NULL DEFAULT NULL,
  `isdel` int(255) NULL DEFAULT 1 COMMENT '1不删除 2删除',
  PRIMARY KEY (`id`, `uid`, `businessid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '足迹' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_member_goodcollect
-- ----------------------------
DROP TABLE IF EXISTS `zzz_member_goodcollect`;
CREATE TABLE `zzz_member_goodcollect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goodid` int(11) NOT NULL,
  `collecttime` int(11) NULL DEFAULT NULL,
  `iscollect` int(255) NULL DEFAULT 1 COMMENT '1收藏 2不收藏',
  PRIMARY KEY (`id`, `uid`, `goodid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品收藏' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_member_storeconcern
-- ----------------------------
DROP TABLE IF EXISTS `zzz_member_storeconcern`;
CREATE TABLE `zzz_member_storeconcern`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `businessid` int(11) NOT NULL,
  `concerntime` int(11) NULL DEFAULT NULL,
  `isconcern` int(255) NULL DEFAULT 1 COMMENT '1关注 2不关注',
  PRIMARY KEY (`id`, `uid`, `businessid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '关注店铺' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for zzz_members
-- ----------------------------
DROP TABLE IF EXISTS `zzz_members`;
CREATE TABLE `zzz_members`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员名',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `collection_num` int(11) NULL DEFAULT NULL COMMENT '商品收藏',
  `shops_concerned_num` int(11) NULL DEFAULT NULL COMMENT '关注店铺',
  `footprint_num` int(11) NULL DEFAULT NULL COMMENT '足迹数',
  `integral` int(11) NULL DEFAULT NULL COMMENT '积分',
  `credit_score` int(11) NULL DEFAULT NULL COMMENT '信誉分',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
