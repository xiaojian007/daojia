<script>

// import {showSuccess} from './util'
// import qcloud from 'wafer2-client-sdk'
// import config from './config'
export default {
  async created () {
    // 调用API从本地缓存中获取数据
    const logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // let user = wx.getStorageSync('userinfo')
    // // 判断是否已经有用户信息
    // if (!user) {
    //   // wafer2-client-sdk 获取用户信息
    //   qcloud.setLoginUrl(config.loginUrl)
    //   qcloud.login({
    //     success: function (userinfo) {
    //       console.log(userinfo)
    //       showSuccess('登录成功')
    //       // 存储本地缓存
    //       wx.setStorageSync('userinfo', userinfo)
    //     },
    //     fail: function (err) {
    //       console.log(err)
    //     }
    //   })
    // }

    // console.log('小程序启动了')

    // const res = await get('/weapp/demo')
    // console.log(123, res)
  }
}
</script>

<style>
@import '../static/iconfont/iconfont.css';
.container {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  box-sizing: border-box;
}
/* this rule will be remove */
* {
  transition: width 2s;
  -moz-transition: width 2s;
  -webkit-transition: width 2s;
  -o-transition: width 2s;
}
.btn{
  color: #fff;
  background: #ea5a49;
  margin-bottom: 10px;
  padding-left: 15px;
  border-radius: 2px;
  font-size: 16px;
  line-height: 40px;
  height: 40px;
  width: 100%;
}
.btn:active{
  background: #f00;
}
.text-primary{
  color: #ea5a49;
}
.text-footer{
  text-align: center;
  font-size: 24rpx;
  color: #aaa;
  margin: 10rpx auto;
}
image{
  width: 100%;
  height: auto;
}
</style>
