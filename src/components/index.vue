<template>
    <div>
        <div class="h-body">
            <router-view></router-view>
        </div>
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
    </div>
</template>

<script>
import Home from './Home'
import Users from './Users'
import Search from './Search'
import Cart from './Cart'
import { Row, Col } from 'vant'

export default {
  components: {
    Home,
    Users,
    Search,
    Cart,
    [Row.name]: Row,
    [Col.name]: Col
  },
  data () {
    return {
      currentView: this.currentUrl,
      w_height: 100,
      w_width: 100,
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
    goPath (url) {
      console.log(url)
    },
    getTabBarUrl (url) {
      this.currentView = url
    }
  },
  created () {
    console.log(this.currentUrl)
  },
  mounted () {
    console.log(this.currentUrl)
  }
}
</script>

<style lang="less">
    @import "//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css";
    .h-body{
        // padding-bottom: 55px;
        height:100%
    }
</style>
