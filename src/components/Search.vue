<template>
  <div>
    <van-search v-model="input_res" placeholder="请输入搜索关键词" show-action @search="onSearch">
      <div slot="action" @click="onSearch">搜索</div>
    </van-search>
    <van-row>
    </van-row>
    <v-footers></v-footers>
  </div>
</template>

<script>
import { Search, Row, Col } from 'vant'
export default {
  components: {
    [Search.name]: Search,
    [Row.name]: Row,
    [Col.name]: Col
  },
  data () {
    return {
      input_res: ''
    }
  },
  methods: {
    onSearch () {
      this.$toast('搜索' + this.input_res)
      // this.$toast.success('s')
    }
  }
}
</script>

<style></style>
