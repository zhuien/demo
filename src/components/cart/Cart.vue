<template>
    <div>
        <van-nav-bar title="购物车" fixed="true" right-text="管理">
        </van-nav-bar>
        <div class="cart_list_body">
            <van-notice-bar mode="closeable">
                足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。
            </van-notice-bar>
            <van-card
                v-for="(good, index) in cart_goods"
                :key="index + '-c-good'"
                :num="good.num"
                :tag="good.tag"
                :price="good.price * good.num"
                :desc="good.desc"
                :title="good.title"
                :thumb="good.img"
                :origin-price="good.o_price * good.num">
                <div slot="footer">
                    <van-stepper v-model="good.num" />
                </div>
            </van-card>
        </div>
        <v-footers></v-footers>
    </div>
</template>

<script>
export default {
  data () {
    return {
      cart_goods: [
        {
          num: 2,
          tag: '秒杀',
          price: 100,
          desc: '描述信息描述信息描述信息描述信息描述信息描述信息',
          title: '360 N7 Pro',
          img: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          o_price: 135
        },
        {
          num: 2,
          tag: '秒杀',
          price: 100,
          desc: '描述信息描述信息描述信息描述信息描述信息描述信息',
          title: '360 N7 Pro',
          img: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          o_price: 135
        },
        {
          num: 2,
          tag: '秒杀',
          price: 100,
          desc: '描述信息描述信息描述信息描述信息描述信息描述信息',
          title: '360 N7 Pro',
          img: '//g-search1.alicdn.com/img/bao/uploaded/i4/imgextra/i1/108126899/O1CN0120pmvGlh9neM2Po_!!0-saturn_solar.jpg_180x180.jpg_.webp',
          o_price: 135
        }
      ]
    }
  }
}
</script>

<style>
.cart_list_body{
    margin-top: 60px;
    padding: 0 10px;
}
.van-notice-bar,.van-card {
    border-radius: 8px;
}
.van-card{
    background: white;
}
</style>
