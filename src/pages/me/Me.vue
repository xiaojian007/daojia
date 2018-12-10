<template>
  <div class="container">
    <!-- 个人信息 -->
    <div class="login-block">
      <img src="../../../static/img/banner-bg.png" class="bgImg" alt="">
      <div class="wrap">
        <div class="box">
          <img class="boxImg" :src="userinfo.avatarUrl" />
          <div v-if="!userinfo.openId" class="verticalv-box">
              <span class="bg-icon name">{{userinfo.nickName}}</span>
          </div>
          <div v-if="userinfo.openId" class="verticalv-box">
              <!--更换奖牌样式，将下面span标签类名更换：普通：common 银牌：silver 金牌：gold 铂金：platina -->
              <span class="bg-icon name" :class="username.tpye">{{userinfo.nickName}} </span>
              <p class="user">
                <em class="usermark">{{username.style}}</em>|
                <em class="score">{{username.integral}}积分</em>
              </p>
          </div>
          <button v-if="!userinfo.openId" class="btn" open-type="getUserInfo" lang="zh_CN" @getuserinfo="bindGetUserInfo" @click="getUserInfo1">权限获取</button>
        </div>
      </div>
    </div>
    <margin :value="20"></margin>
    <!-- 订单 -->
    <div class="myorder">
      <Mold :dataName="myOrder"></Mold>
      <div class="bd">
        <ul class="bd-ul">
          <li class="bd-li" @click="toUrl(0)">
            <span class="bd-span"></span>
            <a id="dqr" class="bd-a havenot">待确认</a>
          </li>
          <li class="bd-li" @click="toUrl(1)">
            <span class="bd-span"></span>
            <a id="dfw" class="bd-a over">待服务</a>
          </li>
          <li class="bd-li" @click="toUrl(2)">
            <span class="bd-span"></span>
            <a id="dzf" class="bd-a stay">待支付</a>
          </li>
          <li class="bd-li" @click="toUrl(3)">
            <span class="bd-span"></span>
            <a id="dpj" class="bd-a all">待评价</a>
          </li>
        </ul>
      </div>
    </div>
    <margin :value="20"></margin>
    <Mold :dataName="cardCoupon"></Mold>
    <Mold :dataName="myAddr"></Mold>
    <margin :value="20"></margin>
    <Mold :dataName="joinWork"></Mold>
    <Mold :dataName="imsetting"></Mold>
    <Mold :dataName="helpCenter"></Mold>
    <margin :value="20"></margin>
    
    <!-- <YearProgress></YearProgress> -->
    <!-- <button v-if="userinfo.openId" @click="scanBook" class="btn">添加图书</button> -->
  </div>
</template>

<script>
  import {showSuccess, post, showModal} from '@/util'
  import qcloud from 'wafer2-client-sdk'
  import config from '@/config'

  import Mold from '@/components/personItem'
  import margin from '@/components/margin'
  import YearProgress from '@/components/Yearprogress'
  export default {
    data () {
      return {
        userinfo: {
          avatarUrl: '../../../static/img/unlogin1.png',
          nickName: '立即登录'
        },
        username: {
          tpye: 'platina',
          style: '铂金',
          integral: 500
        },
        // 卡卷
        cardCoupon: {
          name: '卡卷',
          title: '',
          url: '../../pages/me/cardCoupon/main'
        },
        // 地址
        myAddr: {
          name: '地址',
          title: '',
          url: '../../pages/me/myAddr/main'
        },
        // 我的订单
        myOrder: {
          name: '我的订单',
          title: '查看全部订单',
          url: '../../pages/me/myOrder/main?id=4'
        },
        // 加盟
        joinWork: {
          name: '加盟',
          title: '企业入驻/个人发布',
          url: '../../pages/me/joinWork/main'
        },
        // 聊天
        imsetting: {
          name: '聊天设置',
          title: '',
          url: '../../pages/me/imsetting/main'
        },
        // 帮助
        helpCenter: {
          name: '帮助',
          title: '',
          url: '../../pages/me/helpCenter/main'
        }
      }
    },
    components: {
      YearProgress,
      Mold,
      margin
    },
    methods: {
      async addBook (isbn) {
        const res = await post('/weapp/addbook', {
          isbn,
          openid: this.userinfo.openId
        })
        showModal('添加成功', `${res.title}已添加入库`)
      },
      toUrl (item) {
        wx.navigateTo({
          url: '../../pages/me/myOrder/main?id=' + item,
          success () {
            console.log('成功后的跳转')
          },
          fail () {
            console.log('失败后的跳转')
          },
          complete () {
            console.log('结束后的回调(成功，失败都会执行)')
          }
        })
      },
      scanBook () {
        const self = this
        wx.scanCode({
          success (res) {
            if (res.result) {
              self.addBook(res.result)
            }
            // console.log(res)
          }
        })
      },
      // onGotUserInfo (e) {
      //   if (e.mp.detail) {
      //     this.login()
      //   } else {
      //     console.log(e.mp.detail)
      //   }
      //   // console.log(e.mp.detail)
      //   // console.log(e.detail.userInfo)
      //   // console.log(e.detail.rawData)
      // },
      getSetting () {
        const self = this
        wx.getSetting({
          success (res) {
            if (res.authSetting['scope.userInfo']) {
              wx.getUserInfo({
                success (res) {
                  console.log(res.userInfo)
                  // 用户已经授权过
                  console.log('用户已经授权过')
                  self.login()
                }
              })
            } else {
              console.log('用户还未授权过')
            }
          }
        })
      },
      getUserInfo1 () {
        console.log('click事件首先触发')
        // 判断小程序的API，回调，参数，组件等是否在当前版本可用。  为false 提醒用户升级微信版本
        // console.log(wx.canIUse('button.open-type.getUserInfo'))
        if (wx.canIUse('button.open-type.getUserInfo')) {
          // 用户版本可用
        } else {
          console.log('请升级微信版本')
        }
      },
      bindGetUserInfo (e) {
        // console.log(e.mp.detail.rawData)
        if (e.mp.detail.rawData) {
          // 用户按了允许授权按钮
          console.log('用户按了允许授权按钮')
          this.login()
        } else {
          // 用户按了拒绝按钮
          console.log('用户按了拒绝按钮')
        }
      },
      login () {
        let user = wx.getStorageSync('userinfo')
        const self = this
        // 判断是否已经有用户信息
        if (!user) {
          // wafer2-client-sdk 获取用户信息
          qcloud.setLoginUrl(config.loginUrl)
          qcloud.login({
            success (userinfo) {
              // console.log(userinfo)
              showSuccess('登录成功')
              // 存储本地缓存
              wx.setStorageSync('userinfo', userinfo)
              self.userinfo = userinfo
            },
            fail (err) {
              console.log('登录失败', err)
            }
          })
        }
      }
    },
    created () {
      let userinfo = wx.getStorageSync('userinfo')
      if (userinfo) {
        this.userinfo = userinfo
      }
    },
    mounted () {
      // 一进来看看用户是否授权过
      this.getSetting()
    }
  }
</script>

<style lang="scss">
.container{
  background: #F1F2F6;
  padding-top: 0 30rpx;
  width: 100%;
  margin: 0 auto;
  .login-block{
    position: relative;
    background: linear-gradient(45deg,#E6454D 0,#FF884C 100%);
    width: 100%;
    .bgImg{
      position: absolute;
      width: 100%;
      height: 100%;
      display: block;
      left: 0;
      top: 0;
      z-index: 0;
    }
    .wrap{
      padding: 80rpx 0 56rpx;
      .box {
        position: relative;
        padding-left: 180rpx;
        height: 114rpx;
        .boxImg{
          position: absolute;
          width: 114rpx;
          height: 114rpx;
          left: 40rpx;
          top: 50%;
          margin-top: -56rpx;
          border-radius: 114rpx;
        }
        .verticalv-box{
          height: 114rpx;
          display: table-cell;
          vertical-align: middle;
          .bg-icon{
            background: url(//static.daojia.com/assets/project/user-center-v1.1/images/icon-group.png) no-repeat;
            background-size: 60rpx;
            background-position: right 60rpx;
          }
          .bg-icon.common{
            background-size: 54rpx;
            background-position: right -106rpx;
          }
          .bg-icon.gold{
            background-size: 54rpx;
            background-position: right -210rpx;
          }
          .bg-icon.silver{
            background-size: 52rpx;
            background-position: right -158rpx;
          }
          .bg-icon.platina{
            background-size: 52rpx;
            background-position: right -260rpx;
          }
          .name{
            padding-right: 48rpx;
            font-size: 34rpx;
            color: #fff;
            line-height: 40rpx;
            font-family: PingFangSC-medium;
          }
          .user{
            opacity: .8;
            font-size: 24rpx;
            color: #FFEFCA;
            line-height: 38rpx;
            .usermark{
              position: relative;
              display: inline-block;
              padding-right: 10rpx;
            }
            .score{
              display: inline-block;
              padding-left: 4rpx;
            }
          }
        }
        .btn{
          position: absolute;
          top: 0;
          left: 0;
          z-index: 5;
          opacity: 0;
        }
      }
    }
  }
  .myorder{
    background: #fff;
    width: 100%;
    .bd{
      width: 100%;
      overflow: hidden;
      padding:34rpx 0;
      .bd-ul{
        width: 100%;
        display: flex;
        display: -webkit-flex;
        .bd-li{
          flex: 1;
          text-align: center;
          .bd-a{
            position: relative;
            display: inline-block;
            font-size: 24rpx;
            color: #292d33;
          }
          .bd-span{
            display: block;
            margin: 0 auto 8rpx;
            width: 50rpx;
            height: 50rpx;
            background-color: #000;
            content: "";
            background: url(https://static.daojia.com/fe/h5/app/css/v-userimg/iconGroup_5a4fdc3.png) no-repeat;
            background-size: 60rpx auto;
          }
        }
        .bd-li:first-child{
          .bd-span{
            background-position: center -6rpx;            
          }
        }
        .bd-li:nth-child(2){
          .bd-span{
            background-position: center -64rpx;            
          }
        }
        .bd-li:nth-child(3){
          .bd-span{
            background-position: center -124rpx;            
          }
        }
        .bd-li:nth-child(4){
          .bd-span{
            background-position: center -184rpx;            
          }
        }
      }
    }
  }
}

</style>
