<template>
<van-tabbar v-model="active" style="z-index: 1999">
<van-tabbar-item v-for="(tab, index) in tabbar"
  :icon="tab.icon"
  :to="tab.path"
  :dot="tab.dot"
  :info="tab.info"
  :key="index">
  {{tab.name}}
</van-tabbar-item>
</van-tabbar>
  <!-- <van-tabbar v-model="current">
    <van-tabbar-item icon="wap-home" @click.native="toPath('home')">首页</van-tabbar-item>
    <van-tabbar-item icon="search" @click.native="toPath('search')">搜索</van-tabbar-item>
    <van-tabbar-item icon="cart" @click.native="toPath('cart')">购物车</van-tabbar-item>
    <van-tabbar-item icon="contact" @click.native="toPath('Users')">我的</van-tabbar-item>
  </van-tabbar> -->
</template>

<script>
import { Row, Col } from 'vant'

export default {
  components: {
    [Row.name]: Row,
    [Col.name]: Col
  },
  data () {
    return {
      current: 0,
      active: 0,
      url: '',
      tabbar: [
        {
          name: '首页',
          path: '/',
          pathName: 'home',
          icon: 'wap-home',
          dot: false,
          info: ''
        },
        {
          name: '消息',
          path: '/chat',
          pathName: 'chat',
          icon: 'chat',
          dot: false,
          info: ''
        },
        {
          name: '购物车',
          path: '/cart',
          pathName: 'cart',
          icon: 'cart',
          dot: false,
          info: ''
        },
        {
          name: '我的',
          path: '/users',
          pathName: 'users',
          icon: 'contact',
          dot: false,
          info: ''
        }
      ]
    }
  },
  methods: {
    toPath (url) {
      this.$emit('sendUrl', url)
      this.$router.push(url)
    },
    setActive () {
      console.log(this.current)
      this.tabbar.forEach((tab, i) => {
        if (tab.path === this.current) {
          this.active = i
          return false
        }
      })
    }
  },
  created () {
    this.current = this.$router.history.current.path.toLowerCase()
    this.setActive()
  }
}
</script>

<style>
  @import "//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css";
  .van-tabbar .active,.van-tabbar .van-tabbar-item--active{
    color: #1ac5a6;
  }
</style>
