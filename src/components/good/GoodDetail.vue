<template>
  <div class="goods">
    <van-swipe class="goods-swipe" :autoplay="3000">
      <van-swipe-item v-for="thumb in goods.thumb" :key="thumb">
        <img :src="thumb" >
      </van-swipe-item>
    </van-swipe>

    <van-cell-group>
      <van-cell>
        <div class="goods-title">{{ goods.title }}</div>
        <div class="goods-price">{{ formatPrice(goods.price) }}</div>
      </van-cell>
      <van-cell class="goods-express">
        <van-col span="6">运费：{{ goods.express }}</van-col>
        <van-col span="12" class="goods-express-sell">月销{{ goods.remain }}</van-col>
        <van-col span="6" class="goods-express-location">{{ goods.location }}</van-col>
      </van-cell>
    </van-cell-group>

    <van-cell-group class="goods-cell-group">
      <van-cell value="领券" is-link @click="sorry">
        <template slot="title">
          <span class="van-cell-text">优惠</span>
          <span>123</span>
        </template>
      </van-cell>
      <van-cell is-link @click="sorry">
        <template slot="title">
          <span class="van-cell-text">服务</span>
          <span>极速退货 正品保证</span>
        </template>
      </van-cell>
    </van-cell-group>

    <van-cell-group class="goods-cell-group">
      <van-cell is-link @click="showSpec">
        <template slot="title">
          <span class="van-cell-text">规格</span>
          <span>选择</span>
        </template>
      </van-cell>
      <van-cell is-link @click="sorry">
        <template slot="title">
          <span class="van-cell-text">参数</span>
          <span>选择</span>
        </template>
      </van-cell>
    </van-cell-group>
    <van-sku
      v-model="showspec"
      :sku="sku"
      :goods="goods"
      :goods-id="goodsId"
      :hide-stock="sku.hide_stock"
      :quota="quota"
      :quota-used="quotaUsed"
      :custom-stepper-config="customStepperConfig"
      close-on-click-overlay="true"
      @buy-clicked="onBuyClicked"
      @add-cart="onAddCartClicked"
      @stepper-change="onStepChange"
    />

    <van-cell-group class="goods-cell-group">
      <van-cell value="查看全部" is-link @click="sorry">
        <template slot="title">
          <span class="van-cell-text">评价</span>
        </template>
      </van-cell>
      <p class="evaluate">
        <van-tag class="evaluate-p" round color="#f2826a" v-for="(evals, key, index) in goods.evaluate_stat" :key="index + 'evals'">{{ evals }}</van-tag>
      </p>
    </van-cell-group>

    <div class="store">
      <van-row>
        <van-col span="6"><img class="avatar" src="http://img0.imgtn.bdimg.com/it/u=1717056030,451974468&fm=200&gp=0.jpg"/></van-col>
        <van-col span="12" class="nickname">{{ store.business }}</van-col>
        <!-- <van-col span="6" class="setting"><van-icon name="setting" /></van-col> -->
      </van-row>
      <van-row class="store-comment">
        <van-col span="8">宝贝描述&nbsp;{{ store.gen_comment.desc }}&nbsp;<van-tag class="van-cell-text-p" round color="#f2826a">低</van-tag></van-col>
        <van-col span="8">卖家服务&nbsp;{{ store.gen_comment.seller }}&nbsp;<van-tag class="van-cell-text-p" round color="#f2826a">低</van-tag></van-col>
        <van-col span="8">物流服务&nbsp;{{ store.gen_comment.logistics }}&nbsp;<van-tag class="van-cell-text-p" round color="#f2826a">低</van-tag></van-col>
      </van-row>
    </div>

    <van-goods-action>
      <van-goods-action-mini-btn icon="shop" @click="sorry">
        店铺
      </van-goods-action-mini-btn>
      <van-goods-action-mini-btn icon="chat" @click="sorry">
        客服
      </van-goods-action-mini-btn>
      <van-goods-action-mini-btn icon="cart" @click="onClickCart">
        购物车
      </van-goods-action-mini-btn>
      <van-goods-action-big-btn @click="sorry">
        加入购物车
      </van-goods-action-big-btn>
      <van-goods-action-big-btn primary @click="sorry">
        立即购买
      </van-goods-action-big-btn>
    </van-goods-action>
  </div>
</template>

<script>
import {
  Tag,
  Col,
  Icon,
  Cell,
  CellGroup,
  Swipe,
  Toast,
  SwipeItem,
  GoodsAction,
  GoodsActionBigBtn,
  GoodsActionMiniBtn,
  Sku
} from 'vant'

export default {
  components: {
    [Tag.name]: Tag,
    [Col.name]: Col,
    [Icon.name]: Icon,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Swipe.name]: Swipe,
    [SwipeItem.name]: SwipeItem,
    [GoodsAction.name]: GoodsAction,
    [GoodsActionBigBtn.name]: GoodsActionBigBtn,
    [GoodsActionMiniBtn.name]: GoodsActionMiniBtn,
    [Sku.name]: Sku
  },
  data () {
    return {
      goodsId: 0,
      sku: {
        tree: [
          {
            k: '颜色',
            v: [
              {
                id: '11',
                name: '白色',
                imgUrl: 'https://img.yzcdn.cn/1.jpg'
              },
              {
                id: '22',
                name: '黑色',
                imgUrl: 'https://img.yzcdn.cn/2.jpg'
              }
            ],
            k_s: 's1'
          },
          {
            k: '储存容量',
            v: [
              {
                id: '64',
                name: '64GB'
              },
              {
                id: '128',
                name: '128GB'
              }
            ],
            k_s: 's2'
          }
        ],
        list: [
          {
            id: 2,
            price: 179900,
            s1: '11',
            s2: '64',
            stock_num: 110
          },
          {
            id: 3,
            price: 179900,
            s1: '22',
            s2: '64',
            stock_num: 110
          },
          {
            id: 4,
            price: 199900,
            s1: '11',
            s2: '128',
            stock_num: 110
          },
          {
            id: 5,
            price: 199900,
            s1: '22',
            s2: '128',
            stock_num: 110
          }
        ],
        price: '1799', // 默认价格（单位元）
        stock_num: 227, // 商品总库存
        collection_id: 2, // 无规格商品 skuId 取 collection_id，否则取所选 sku 组合对应的 id
        none_sku: false, // 是否无规格商品
        hide_stock: false // 是否隐藏剩余库存
      },
      goods: {
        title: '360 N7 Pro',
        price: 1799,
        express: '免运费',
        remain: 19,
        location: '广东中山',
        thumb: [
          'https://img.yzcdn.cn/public_files/2017/10/24/e5a5a02309a41f9f5def56684808d9ae.jpeg',
          'https://img.yzcdn.cn/public_files/2017/10/24/1791ba14088f9c2be8c610d0a6cc0f93.jpeg'
        ],
        picture: 'https://img.yzcdn.cn/1.jpg',
        evaluate: 5075,
        evaluate_stat: [
          '质量不错(7512)', '好看(621)', '舒服(125)'
        ]
      },
      store: {
        business: 'business',
        icon: '',
        experience: '',
        gen_comment: {
          'desc': 4.8,
          'seller': 4.8,
          'logistics': 4.8
        }
      },
      showspec: true
    }
  },
  methods: {
    getDetail () {
      this.axios.post('')
    },
    formatPrice () {
      return '¥' + (this.goods.price / 100).toFixed(2)
    },
    onClickCart () {
      this.$router.push('cart')
    },
    sorry () {
      Toast('暂无后续逻辑~')
    },
    showSpec () {
      this.showspec = true
    },
    onBuyClicked () {},
    onAddCartClicked () {},
    onStepChange () {}
  },
  create () {
    console.log(this.$router.params.goodid)
  }
}
</script>

<style lang="less">
.goods {
  padding-bottom: 50px;
  &-swipe {
    img {
      width: 7.5rem;
      height: 7.5rem;
      display: block;
    }
  }
  &-title {
    font-size: 16px;
  }
  &-price {
    color: #f44;
  }
  &-express {
    color: #999;
    font-size: 12px;
    padding: 5px 15px;
    &-location {
      text-align: right;
    }
    &-sell {
      text-align: center ;
    }
  }
  &-cell-group {
    margin: 15px 0;
    .van-cell__value {
      color: #999;
    }
    .van-cell-text{
      color: #999;
      // font-size: .22rem;
      margin-right: 8px;
      &-p{
        margin-right: 4px;
      }
      &-bd{
       margin-top: 5px;
      }
    }
    .evaluate{
      margin-top: -.2rem;
      line-height: .3rem;
      margin-bottom: .15rem;
      padding: 0 .2rem;
      &-p{
        margin-bottom: .15rem;
        margin-top: -.05rem;
        margin-left: .1rem;
      }
    }
  }
  &-tag {
    margin-left: 5px;
  }
  .store{
    font-size: 0.24rem;
    color: #999;
    background: white;
    padding: 6px;
    &-comment{
      text-align: center;
      .van-tag{
        font-size: .18rem;
        padding: .1em .25em;
        border-radius: .7em;
      }
    }
    .avatar{
      width: 1.2rem;
      border-radius: .1rem;
      margin-left: 0.3375rem;
    }
    .nickname{
      font-size: .35rem;
      color: #222222;
    }
  }
}

</style>
