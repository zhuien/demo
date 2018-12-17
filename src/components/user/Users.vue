<template>
  <div>
    <van-nav-bar class="headnav" title="nickname" fixed="true">
      <van-icon name="setting" slot="right" />
    </van-nav-bar>
    <div class="content">
      <div class="header">
        <van-row>
          <van-col span="6"><img class="avatar" src="http://img0.imgtn.bdimg.com/it/u=1717056030,451974468&fm=200&gp=0.jpg"/></van-col>
          <van-col span="12" class="nickname">{{ user.nickname }}</van-col>
          <van-col span="6" class="setting"><van-icon name="setting" /></van-col>
        </van-row>
        <van-row class="num-btn">
          <van-col span="6"><p>121</p><p>收藏夹</p></van-col>
          <van-col span="6"><p>16</p><p>关注店铺</p></van-col>
          <van-col span="6"><p>28</p><p>足迹</p></van-col>
          <van-col span="6"><p>0</p><p>红包卡券</p></van-col>
        </van-row>
      </div>
      <div class="order">
        <van-row>
          <van-col span="24">
            <van-cell-group class="user-group">
              <van-cell title="我的订单" is-link  value="查看全部订单"/>
            </van-cell-group>
          </van-col>
        </van-row>
        <van-row class="user-links">
          <van-col span="4">
            <van-tag round type="danger" class="p-abs">0</van-tag>
            <van-badge info="8" />
            <van-icon name="pending-payment" />
            <span>待付款</span>
          </van-col>
          <van-col span="4">
            <van-tag round type="danger" class="p-abs">0</van-tag>
            <van-icon name="tosend" />
            <span>待发货</span>
          </van-col>
          <van-col span="4">
            <van-tag round type="danger" class="p-abs">0</van-tag>
            <van-icon name="logistics" />
            <span>待收货</span>
          </van-col>
          <van-col span="4">
            <van-tag round type="danger" class="p-abs">0</van-tag>
            <van-icon name="pending-evaluate" />
            <span>评价</span>
          </van-col>
          <van-col span="4">
            <van-tag round type="danger" class="p-abs">0</van-tag>
            <van-icon name="cash-back-record" />
            <span>退款/售后</span>
          </van-col>
        </van-row>
      </div>
      <div class="card" v-for="(c, key, index) in user.card" :key="index + 'card'">
        <van-row>
          <van-col span="24" class="c-header">
            <span class="c-title">{{ c.title }}</span>
          </van-col>
        </van-row>
        <van-row>
          <van-col span="24" class="c-item" v-for="clist in c.list" :key="clist.id + 'clist'" v-if="c.list.length == 1">
            <h3 class="i-t">{{ clist.item_title }}<span v-if="clist.type == 1" class="i-tc">{{ clist.item_title_com }}</span></h3>
            <p class="i-st">{{ clist.item_subtitle }}</p>
            <p class="i-d">{{ clist.desc }}</p>
          </van-col>
          <van-col span="12" class="c-item" v-for="clist in c.list" :key="clist.id + 'clist'" v-if="c.list.length == 2">
            <h3 class="i-t">{{ clist.item_title }}<span v-if="clist.type == 1" class="i-tc">{{ clist.item_title_com }}</span></h3>
            <p class="i-st">{{ clist.item_subtitle }}</p>
            <p class="i-d">{{ clist.desc }}</p>
          </van-col>
          <van-col span="24" class="c-footer">
            <van-button plain type="primary">{{ c.more_btn }}</van-button>
          </van-col>
        </van-row>
      </div>
      <v-footers></v-footers>
    </div>
  </div>
</template>

<script>
import { Row, Col, Icon, Cell, CellGroup } from 'vant'

export default {
  components: {
    [Row.name]: Row,
    [Col.name]: Col,
    [Icon.name]: Icon,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup
  },
  data () {
    return {
      user: {
        nickname: 'nick',
        card: {
          account: {
            title: '我的账户',
            title_icon: '',
            more_btn: '查看更多服务',
            more_btn_url: '',
            list: [
              {
                item_id: 1,
                item_title: '31.94',
                item_title_com: '元',
                item_subtitle: '本月消费',
                desc: '话来多少',
                type: 1,
                url: ''
              }
            ]
          },
          member: {
            title: '我的积分',
            title_icon: '',
            more_btn: '领取会员权益',
            more_btn_url: '',
            list: [
              {
                item_id: 1,
                item_title: '508',
                item_title_com: '元',
                item_subtitle: '本月消费',
                desc: '话来多少',
                type: 1,
                url: ''
              }
            ]
          }
        }
      }
    }
  }
}
</script>

<style>
  .p-abs{
    position: absolute;
    top: 0;
    right: 8px;
    z-index: 12;
  }
  .headnav{
    background: #1ac5a6;
    opacity: 0;
    display: none;
  }
  .van-hairline--bottom::after{
    border-bottom-width: 0;
  }
  .content{
    /* margin-top: 46px; */
    font-size: .2rem;
    margin-bottom: 55px;
  }
  .header{
    padding-top: 35px;
    color: white;
    background: #1ac5a6;
  }
  .header .avatar{
    width: 1.2rem;
    border-radius: 1.1rem;
    margin-left: 0.3375rem;
  }
  .header .nickname{
    font-size: .5rem;
    font-weight: 600;
  }
  .header .setting{
    font-size: .35rem;
    font-weight: 600;
    text-align: end;
    padding-right: 15px;
  }
  .header .num-btn{
    text-align: center;
    font-size: 0.25rem;
  }
  .order{
    margin: 0 10px;
    margin-top: 10px;
    border-radius: 8px;
    font-size: .2rem;
    background: white;
  }
  .order .van-cell,.order .van-cell-group {
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
  }
  .van-cell{
    color: black
  }
  .order .user-links .van-col{
    width: 20%;
  }
  .order .user-links .van-col i{
    line-height: .7rem;
  }
  .order .user-links .van-col span{
    line-height: .35rem;
    color: #4b4b4b;
  }
  .order .user-links .van-col .van-tag{
    padding: 0.05rem 0.1rem;
    border-radius: 0.18rem;
    color: white;
    line-height: .22rem;
    font-size: 0.17rem;
  }
  .order .user-links .van-tag span{
    color: white;
  }
  .user-poster {
    width: 100%;
    /* height: 4rem; */
    display: block;
  }
  .user-group {
    /* margin-bottom: .3rem; */
  }
  .user-group .van-cell__value{
    font-size: .2rem;
    color: #b6b6b6;
  }
  .user-links {
    padding: 8px 0;
    /* font-size: .22rem; */
    text-align: center;
    background-color: #fff;
    border-bottom-left-radius: 8px;
    border-bottom-right-radius: 8px;
  }
  .user-links .van-icon {
    display: block;
    font-size: 24px;
  }
  .user-links .van-col{
    position: relative;
  }
  .card{
    margin: 0 10px;
    margin-top: 10px;
    border-radius: 8px;
    font-size: .2rem;
    background: white;
    padding-bottom: 10px;
  }
  .card .c-header{
    user-select: none;
    text-align: center;
    line-height: 0.55rem;
    border-bottom: 1px solid #eee;
    color: black;
    padding: 5px 0;
  }
  .card .c-header .c-title{
    margin: 0 auto;
    max-width: 60%;
    font-size: .32rem;
    line-height: 0.58rem;
    font-weight: 500;
  }
  .card .c-item {
    text-align: center;
    padding: 6px 0;
  }
  .card .c-item .i-t{
    font-size: 0.45rem;
    color: steelblue;
    line-height: 0.5rem;
    margin-block-start: .5em;
    margin-block-end: .5em;
  }
  .card .c-item .i-tc{
    font-size: 0.25rem;
    padding-left: 5px;
  }
  .card .c-item .i-st{
    font-size: 0.26rem;
    line-height: .45rem;
    margin-block-start: 0;
    margin-block-end: 0;
  }
  .card .c-item .i-d{
    font-size: 0.26rem;
    color: #b6b6b6;
    line-height: .45rem;
    margin-block-start: 0;
    margin-block-end: 0;
  }
  .card .c-footer{
    margin: 3px auto;
    text-align:center;
  }
  .card .c-footer button{
    height: .45rem;
    line-height: .44rem;
    border-radius: .225rem;
    color: #1ac5a6;
    border-color: #1ac5a6;
  }
</style>
