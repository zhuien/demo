<template>
  <div class="home" @load="onGetGoods" :class="{homeTop:isFixed}">
    <van-row :class="{isFixed:isFixed,isShow:isShow}" style="display:none">
      <van-col span="24">
        <!-- <sticky> -->
          <div class="stickyed">
            <van-search v-model="input_res" background="#1ac5a6" placeholder="请输入搜索关键词" show-action @search="onSearch">
              <div slot="action" @click="onSearch" style="color: white">搜索</div>
            </van-search>
          </div>
        <!-- </sticky> -->
      </van-col>
    </van-row>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <van-row>
        <van-swipe class="goods-swipe" :autoplay="3000">
          <van-swipe-item v-for="slide in slidelist" :key="slide.id + '-silde'">
            <img :src="slide.img" >
          </van-swipe-item>
        </van-swipe>
      </van-row>
      <van-row class="menucon">
        <div class="col5" v-for="menu in menulist" :key="menu.id + '-menu'" @click="go(menu.id)">
          <div class="menupic">
            <div class="menupicbody" :style="{backgroundImage: 'url(' + menu.img + ')'}"></div>
          </div>
          <div class="menutitle">{{ menu.title }}</div>
        </div>
      </van-row>
      <div style="height:12px;"></div>
      <van-row class="goodcon">
        <van-col span="12" v-for="good in goodlist" :key="good.id + '-good'" class="goodbody">
          <div class="item_list">
            <div class="p">
              <a href="javascript:;" @click="goodDetail(good.id)">
                <img :src="good.pic" class="p-pic" />
                <span></span>
              </a>
            </div>
            <div class="d">
              <a href="">
                <h3 class="d-title">{{ good.title }}</h3>
              </a>
              <p class="d-price">
                <em class="h">
                  <span class="price-icon">￥</span>
                  <span class="font-num">{{ good.currentPrice }}</span>
                </em>
                <del>
                  <span class="price-icon">¥</span>
                  <span class="font-num">{{ good.originalPrice }}</span>
                </del>
              </p>
              <div class="d-main">
                <p class="d-freight"></p>
                <p class="d-num"><span class="font-num">{{ good.payNum }}</span>人付款</p>
                <p class="d-area"></p>
              </div>
            </div>
          </div>
        </van-col>
      </van-row>
      <div class="van-list__loading" style="/* display: none; */"><div class="van-loading van-loading--circular van-loading" style="color: rgb(201, 201, 201);"><span class="van-loading__spinner van-loading__spinner--circular"><svg viewBox="25 25 50 50" class="van-loading__circular"><circle cx="50" cy="50" r="20" fill="none"></circle></svg></span></div><span class="van-list__loading-text">加载中...</span></div>
    </van-pull-refresh>
    <v-footers></v-footers>
  </div>
</template>

<script>
import {
  Row,
  Tag,
  Col,
  Icon,
  Cell,
  CellGroup,
  Swipe,
  // Toast,
  SwipeItem,
  GoodsAction,
  GoodsActionBigBtn,
  GoodsActionMiniBtn,
  Lazyload
} from 'Vant'

export default {
  components: {
    // 'v-Footer': Footer
    [Row.name]: Row,
    [Col.name]: Col,
    [Tag.name]: Tag,
    [Icon.name]: Icon,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Swipe.name]: Swipe,
    [SwipeItem.name]: SwipeItem,
    [GoodsAction.name]: GoodsAction,
    [GoodsActionBigBtn.name]: GoodsActionBigBtn,
    [GoodsActionMiniBtn.name]: GoodsActionMiniBtn,
    [Lazyload.name]: Lazyload
  },
  name: 'Home',
  data () {
    return {
      input_res: '',
      page: 1,
      psize: 8,
      url: '',
      width: 500,
      height: 360,
      goodlist: [
        {
          id: 1,
          url: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          pic: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          title: 'OPPO find x 曲面全面屏',
          desc: '',
          currentPrice: 4999,
          originalPrice: 0,
          payNum: 139
        },
        {
          id: 2,
          url: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          pic: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          title: 'OPPO find x 曲面全面屏',
          desc: '',
          currentPrice: 4999,
          originalPrice: 0,
          payNum: 139
        },
        {
          id: 3,
          url: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          pic: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          title: 'OPPO find x 曲面全面屏',
          desc: '',
          currentPrice: 4999,
          originalPrice: 0,
          payNum: 139
        },
        {
          id: 4,
          url: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          pic: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          title: 'OPPO find x 曲面全面屏',
          desc: '',
          currentPrice: 4999,
          originalPrice: 0,
          payNum: 139
        },
        {
          id: 5,
          url: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          pic: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          title: 'OPPO find x 曲面全面屏',
          desc: '',
          currentPrice: 4999,
          originalPrice: 0,
          payNum: 139
        }
      ],
      slidelist: [
        {
          id: 1,
          url: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          img: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          label: '图1'
        },
        {
          id: 2,
          url: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          img: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          label: '图2'
        },
        {
          id: 3,
          url: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          img: '//img.alicdn.com/imgextra/i4/268451883/O1CN011PmSGFNg0y6H1PI_!!268451883.jpg_1080x1800Q50s50.jpg_.webp',
          label: '图3'
        }
      ],
      menulist: [
        {
          id: 1,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        },
        {
          id: 2,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        },
        {
          id: 3,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        },
        {
          id: 4,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        },
        {
          id: 5,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        },
        {
          id: 5,
          url: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          img: 'https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp',
          title: '测试'
        }
      ],
      isFixed: false,
      isShow: true,
      isLoading: false
    }
  },
  methods: {
    getGoods () {
      this.$axios.post(this.url, {
        page: this.page,
        psize: this.psize
      }).then(e => {
        console.log(e)
      }).catch(e => {
        console.log(e)
      })
    },
    goodDetail (goodid) {
      console.log(goodid)
      this.$router.push('/gooddetail', {goodid: goodid})
    },
    onResize () {
      this.width = document.body.clientWidth
      this.height = document.body.clientHeight
    },
    go (url) {
      this.$router.push(url)
    },
    onGetGoods () {
      console.log('=')
    },
    onRefresh () {
      console.log(this.isLoading)
      setTimeout(() => {
        this.isLoading = false
      }, 2000)
    },
    handleScroll () {
      var scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
      console.log(scrollTop)
      console.log(scrollTop >= 1)
      if (scrollTop === 0) {
        this.isFixed = false
      } else {
        this.isFixed = true
      }
    }
  },
  create () {
    this.width = document.body.clientWidth
    this.height = document.body.clientHeight
  },
  mounted () {
    // window.addEventListener('scroll', this.handleScroll)
  },
  deactivated () {
    window.removeEventListener('scroll', this.throttleScroll)
  }
}
</script>

<style lang="less" scoped>
  body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td {
    margin: 0;
    padding: 0;
  }
  em, i {
    font-style: normal;
  }
  .isFixed {
    position: fixed;
    left: 0;
    top: 0;
    right: 0;
    z-index: 9999;
  }
  .homeTop{
    padding-top: 45px;
  }
  .home {
    margin-bottom: 55px;
    .goods-swipe img {
      width: 7.5rem;
      height: 6rem;
      display: block;
    }
    .menucon{
      padding: 0 2%;
      .col5{
        float: left;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        width: 20%;
        .menupic{
          height: 1.3rem;
          padding-top: 0.1rem;
          padding-left: 0.08rem;
          .menupicbody{
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-position: center center;
            background-size: contain;
            /* background-image: url("https://gw.alicdn.com/tfs/TB1Wxi2trsrBKNjSZFpXXcXhFXa-183-144.png_.webp"); */
            box-sizing: content-box;
          }
        }
        .menutitle{
          font-size: 0.22rem;
          text-align: center;
          color: rgb(102, 102, 102);
          overflow: hidden;
        }
      }
    }
    .goodcon{
      padding: 0 2%;
      .goodbody {
        float: left;
        width: 49%;
        padding: 12px 0;
        overflow: hidden;
        background: white;
        border-radius: 10px;
        margin: 0 .5%;
        margin-top: 5px;
        .item_list {
          display: block;
          padding: 0 12px;
          .h {
            color: #eb5211;
          }
          .p {
            display: block;
            width: 100%;
            margin-bottom: 5px;
            margin-left: 0;
            overflow: hidden;
            a {
              line-height: 79px;
              display: inline-block;
              position: relative;
            }
            a {
              line-height: 126px;
              border: none;
              background: none;
              text-align: center;
              width: 100%;
              padding: 50% 0;
              height: 0;
            }
            .p-pic {
              width: 100%;
              position: absolute;
              top: 0;
              left: 0;
            }
          }
          .price-icon {
            font-family: arial;
            padding-right: 2px;
          }
          .font-num {
            font-family: avenir arial;
          }
        }
      }
      .goodbody_border{
        border-left: 1px solid #e0e1e1;
        border-bottom: 1px solid #e0e1e1;
        margin-left: -1px;
      }
      .d {
        .d-title {
          font-size: 0.3rem;
          overflow: hidden;
        }
        p {
          line-height: 0.6rem;
          color: #999;
        }
        .d-price {
          line-height: 0.25rem;
          .h {
            font-size: 0.3rem;
          }
          del {
            font-size: 0.26rem;
          }
        }
        .d-main {
          display: -webkit-box;
          margin-top: -1px;
          overflow: hidden;
          margin-top: 0;
          line-height: 0.25rem;
          p {
            line-height: 0.4rem;
            font-size: .25rem;
            overflow: hidden;
          }
          .d-num {
            width: 100%;
            text-align: left;
          }
          .d-area {
            text-align: right;
          }
        }
      }
    }
    .topborder{
      border-top: 1px solid #e0e1e1;
    }
    .van-search .van-cell {
      background: #1ac5a6;
      color: white;
    }
  }
</style>
