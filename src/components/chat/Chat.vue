<template>
<div class="chat">
    <div class="chat-head">
        <van-row class="chat-head-t">
            <van-col span="16"><span>消息</span></van-col>
            <van-col span="4">&nbsp;</van-col>
            <van-col span="4" class="add"><van-icon name="add"/></van-col>
        </van-row>
        <van-row class="chat-head-m">
            <van-col span="24">
                <span>{{ msg }}</span>
                <van-icon name="clear" @click="clearMsg"/>
            </van-col>
        </van-row>
        <van-row class="chat-head-f">
            <van-col span="8" @click.native="clearMsg">
                <div class="d">
                    <div class="dd">
                        <van-icon name="logistics"/>
                    </div>
                </div>
                <p>消息</p>
            </van-col>
            <van-col span="8" @click.native="clearMsg">
                <div class="d">
                    <div class="dd" style="background: #fcb31a">
                        <van-icon name="logistics"/>
                    </div>
                </div>
                <p>通知</p>
            </van-col>
            <van-col span="8" @click.native="clearMsg">
                <div class="d">
                    <div class="dd" style="background: #05e012">
                        <van-icon name="pending-evaluate"/>
                    </div>
                </div>
                <p>互动</p>
            </van-col>
        </van-row>
    </div>
    <div class="chat-item p-top35">
        <van-card
            v-for="(p_i, index) in p_num" :key="index + 'p_i'"
            :desc="p_i.desc"
            :title="p_i.title"
            :price="p_i.time"
            currency=""
            :thumb="p_i.avatar">
        </van-card>
    </div>
    <div class="chat-item m-top10">
        <p>两周前的消息</p>
        <van-card
            v-for="(p_i, index) in p_num" :key="index + 'p_i'"
            :desc="p_i.desc"
            :title="p_i.title"
            :price="p_i.time"
            currency=""
            :thumb="p_i.avatar">
        </van-card>
    </div>
    <v-footers></v-footers>
</div>
</template>

<script>
import { Toast } from 'vant'
export default {
  data () {
    return {
      msg: '没有未读消息',
      p_num: [
        {
          avatar: 'http://img0.imgtn.bdimg.com/it/u=1717056030,451974468&fm=200&gp=0.jpg',
          desc: '淘宝头条',
          title: '闺蜜可以是塑料',
          time: '星期五'
        },
        {
          avatar: 'http://img0.imgtn.bdimg.com/it/u=1717056030,451974468&fm=200&gp=0.jpg',
          desc: '淘宝头条',
          title: '闺蜜可以是塑料',
          time: '星期五'
        },
        {
          avatar: 'http://img0.imgtn.bdimg.com/it/u=1717056030,451974468&fm=200&gp=0.jpg',
          desc: '淘宝头条',
          title: '闺蜜可以是塑料',
          time: '星期五'
        }
      ]
    }
  },
  methods: {
    clearMsg () {
      Toast('clear')
    }
  },
  mounted () {
  }
}
</script>

<style lang="less">
    .chat{
        font-size: .45rem;
        color: #cccccc;
        margin-bottom: 55px;
        &-head{
            background: #1ac5a6;
            color: white;
            padding-left: .3rem;
            padding-right: .3rem;
            padding-bottom: 1.5rem;
            position: relative;
            &-t{
                line-height: .45rem;
                padding: 8px 0;
                span{
                    margin: 5px;
                }
                .add{
                    text-align: right;
                }
            }
            &-m{
                font-size: .33rem;
            }
            &-f{
                background: white;
                color: #333333;
                border-radius: 15px;
                margin: 8px 0;
                text-align: center;
                position: absolute;
                width: 92.5%;
                bottom: -20px;
                box-sizing: content-box;
                box-shadow: 0px 5px 12px #e0e0e0;
                .d{
                    margin: 0 auto;
                    margin-top: .2rem;
                    .dd{
                        width: .9rem;
                        height: .9rem;
                        display: inline-block;
                        border-radius: .45rem;
                        line-height: 1.1rem;
                        background: #00b0ff;
                        color: white;
                        font-size: .5rem;
                    }
                }
                p{
                    margin-block-start: .1rem;
                    margin-block-end: .1rem;
                    line-height: .4rem;
                    font-size: .27rem;
                }
            }
        }
        &-item{
            background: white;
            padding-bottom: 5px;
            .van-card{
                border-radius: 0;
                height: 70px;
                background: white;
                padding-left: 85px;
                .van-card__thumb{
                    width: 60px;
                    height: 60px;
                }
                .van-card__content{
                    height: 60px;
                    .van-card__desc, .van-card__title {
                        line-height: 25px;
                        font-size: 16px;
                    }
                    .van-ellipsis{
                        font-size: 14px;
                    }
                    &:after{
                        // content: '';
                        // position: absolute;
                        // bottom: 0;
                        // left: 85px;
                        // right: 0;
                        // height: 1px;
                        // transform: scaleY(.3);
                        // background: #bdbdbd;
                    }
                }
                &:not(&:last-child(.van-card__content))::after{
                    content: '';
                    position: absolute;
                    bottom: 0;
                    left: 85px;
                    right: 0;
                    height: 1px;
                    transform: scaleY(.3);
                    background: #bdbdbd;
                }
            }
            p{
                color: #929292;
                padding-left: 15px;
                font-size: .35rem;
                margin-block-start: .1rem;
                margin-block-end: .05rem;
                font-weight: 600;
            }
        }
        .p-top35{
            padding-top: 35px;
        }
        .m-top10{
            margin-top: 10px;
        }
    }
</style>
