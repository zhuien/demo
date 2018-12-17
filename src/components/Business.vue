<template>
    <div class="b_body">
        <div>
            <van-row>
                <van-col span="24">
                    <span>{{ business.business_neme }}</span>
                    <van-tag round v-if="business.is_follow == 1">已关注</van-tag>
                    <van-tag round v-if="business.is_follow != 1">关注</van-tag>
                </van-col>
                <van-col span="24"></van-col>
                <van-col span="24"></van-col>
            </van-row>
        </div>
    </div>
</template>

<script>
export default {
  data () {
    return {
      business: {
        business_name: 'business',
        is_follow: 1
      }
    }
  },
  created () {
    console.log('created')
  }
}
</script>

<style lang="less">
    .b_body{
        background: white;
    }
</style>
