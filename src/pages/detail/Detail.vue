<template>
  <div>
    <BookInfo :info="info"></BookInfo>
    <CommentList :comments="comments"></CommentList>
    <div class="comment" v-if="showAdd">
      <textarea 
        placeholder="请输入读后短评" 
        :maxlength="100"
        class="textarea"
        v-model="comment"
      >{{comment}}</textarea>
      <div class="location">
        地理位置
        <switch :checked='locations' @change="getGeo" color="#ea5a49"></switch>
        <span class="text-primary">{{locations}}</span>
      </div>
      <div class="phone">
        手机型号
        <switch :checked="phone" @change="getPhone" color="#ea5a49"></switch>
        <span class="text-primary">{{phone}}</span>
      </div>
      <button class="btn" @click="addComment">评论</button>
    </div>
    <div class="text-footer" v-else>
      未登录或已评论过啦
    </div>
    <div class="fixed">
      <button class="btn" open-type="share">转发给好友</button>
      <button @click="toList" class="btn">返回列表</button>
    </div> 
  </div>
</template>

<script>
  import { get, post, showModal, newDate } from '@/util'

  import BookInfo from '@/components/Bookinfo'
  import CommentList from '@/components/CommentList'
  export default {
    data () {
      return {
        comments: [],
        userinfo: {},
        bookid: '',
        info: {},
        comment: '',
        locations: '',
        phone: ''
      }
    },
    components: {
      BookInfo,
      CommentList
    },
    computed: {
      // 没登录
      showAdd () {
        if (!this.userinfo.openId) {
          return false
        }

        // 评论过了
        if (this.comments.filter(v => v.openid === this.userinfo.openId).length) {
          return false
        }
        return true
      }
    },
    onShareAppMessage () {
      console.log(1)
    },
    methods: {
      async addComment () {
        if (this.comment === '') {
          console.log('请输入文字')
          return
        }
        // openid 图书id 评价内容 手机型号 地理位置
        const data = {
          openid: this.userinfo.openId,
          bookid: this.bookid,
          comment: this.comment,
          phone: this.phone,
          location: this.locations,
          times: newDate(new Date())
        }
        try {
          await post('/weapp/addcomment', data)
          this.comment = ''
          this.getComments()
        } catch (e) {
          showModal('失败', e.msg)
        }
      },
      async getDetail () {
        const info = await get('/weapp/bookdetail', {id: this.bookid})
        this.info = info
        wx.setNavigationBarTitle({
          title: info.title,
          success (res) {
            // success
          },
          fail (res) {
            console.log('标题调用失败')
          }
        })
      },
      async getComments () {
        const comments = await get('/weapp/commentlist', {bookid: this.bookid})
        this.comments = comments.list || []
      },
      getGeo (e) {
        // z6AP6YrSFao1SW9ZHxjxCESdePhjaAuf 百度地图api的token
        // http://api.map.baidu.com/geocoder/v2/?callback=renderReverse&location=35.658651,139.745415&output=json&pois=1&ak=您的ak
        const ak = 'z6AP6YrSFao1SW9ZHxjxCESdePhjaAuf'
        let url = 'http://api.map.baidu.com/geocoder/v2/'
        const self = this
        // console.log(e)
        if (e.mp.detail.value) {
          wx.getLocation({
            type: 'wgs84', // 默认为 wgs84 返回 gps 坐标，gcj02 返回可用于 wx.openLocation 的坐标
            success (geo) {
              // success
              // console.log(geo)
              wx.request({
                url,
                data: {
                  ak,
                  location: `${geo.latitude}, ${geo.longitude}`,
                  output: 'json'
                },
                header: {
                  'content-type': 'application/json' // 默认值
                },
                success (res) {
                  // console.log(res)
                  if (res.data.status === 0) {
                    self.locations = res.data.result.addressComponent.city
                  } else {
                    this.locations = '未知地区'
                    console.log('获取失败')
                  }
                }
              })
            },
            fail () {
              // fail
            },
            complete () {
              // complete
            }
          })
        } else {
          this.locations = ''
        }
      },
      getPhone (e) {
        // console.log(e)
        if (e.mp.detail.value) {
          const phoneInfo = wx.getSystemInfoSync()
          this.phone = phoneInfo.model
        } else {
          this.phone = ''
        }
      },
      toList () {
        console.log(1)
        wx.navigateBack()
      }
    },
    mounted () {
      this.bookid = this.$root.$mp.query.id
      this.getDetail()
      this.getComments()
      let userinfo = wx.getStorageSync('userinfo')
      if (userinfo) {
        this.userinfo = userinfo
      }
    }
  }
</script>
<style lang='scss'>
.comment{
  margin-top:10px;
  .textarea{
    height:180rpx;
    background:#eee;
    font-size: 28rpx;
    color: #000;
    padding: 20rpx;
    width: 670rpx;
    margin:20rpx;
  }
  .location{
    font-size: 28rpx;
    margin-top:10rpx;
    padding:5rpx 10rpx;
  }
  .phone{
    font-size: 28rpx;
    margin:10rpx 0;
    padding:5rpx 10rpx;
  }
  .btn{
    width: 94%;
  }
}
.fixed{
  width: 94%;
  margin: 0 auto;
  // position: fixed;
// left: 3%;
// bottom: 0;
// z-index: 5;
}
</style>
