import './common/rem'
import Vue from 'vue'
import App from './App'
import router from './router'
import Vant from 'vant'
import axios from 'axios'
import VueAxios from 'vue-axios'
import footers from './components/footer.vue'
import 'vant/lib/index.css'

Vue.config.productionTip = true

Vue.use(Vant)
Vue.use(VueAxios, axios)

Vue.component('v-footers', footers)
/* eslint-disable no-new */
// Vue.prototype.$http= axios

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  if (to.matched.some(record => record.meta.requireAuth)) {
    axios.post('http://127.0.0.1/cmsdemo/index/login/loginstat')
      .then(function (e) {
        console.log(e)
        if (e.data.code === 2) {
          next({
            path: '/login'
          })
        } else {
          next()
        }
      })
      .catch(function (e) {
        console.log(e)
      })
  }
  next()
})
Vue.prototype.isLogin = false
Vue.prototype.currentUrl = 'Home'
Vue.prototype.login = function (username, password) {
  axios.post('http://127.0.0.1/cmsdemo/index/login/loginstat')
    .then(function (response) {
      console.log(response)
      if (response.data.code === 2) {
      } else {
      }
    })
    .catch(function (error) {
      console.log(error)
    })
}

Vue.prototype.logout = function () {
  this.isLogin = false
}
new Vue({
  el: '#app',
  router,
  components: {
    App
  },
  template: '<App/>',
  methods: {
  }
})
