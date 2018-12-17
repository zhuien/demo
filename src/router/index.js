import Vue from 'vue'
import Router from 'vue-router'
// import Index from '@/components/index'
import Home from '@/components/home/Home'
import Search from '@/components/Search'
import Cart from '@/components/cart/Cart'
import Chat from '@/components/chat/Chat'
import Users from '@/components/user/Users'
import GoodDetail from '@/components/good/GoodDetail'
import Business from '@/components/Business'
import Footers from '@/components/footer'
import Login from '@/components/login/Login'
// <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/index',
    //   name: 'Index',
    //   component: Index,
    //   meta: {
    //     title: 'Index'
    //   }
    // },
    {
      path: '/',
      name: 'Home',
      component: Home,
      meta: {
        title: '我的商城demo'
      }
    },
    {
      path: '/search',
      name: 'Search',
      component: Search,
      meta: {
        title: '搜索'
      }
    },
    {
      path: '/chat',
      name: 'Chat',
      component: Chat,
      meta: {
        title: '消息'
      }
    },
    {
      path: '/cart',
      name: 'Cart',
      component: Cart,
      meta: {
        title: '购物车'
      }
    },
    {
      path: '/users',
      name: 'Users',
      component: Users,
      meta: {
        title: '个人中心'
      }
    },
    {
      path: '/gooddetail',
      name: 'GoodDetail',
      component: GoodDetail,
      meta: {
        title: '商品详情'
      }
    },
    {
      path: '/business',
      name: 'Business',
      component: Business,
      meta: {
        title: '商店'
      }
    },
    {
      path: '/footers',
      name: 'Footers',
      component: Footers,
      meta: {
        title: '商店'
      }
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    }
  ]
})
