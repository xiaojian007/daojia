<template>
  <div class="joinUs">
    <img mode="widthFix" class="join-img" src="../../../static/img/join.jpg" alt="">
    <view class="page-section">
      <view class="weui-cells__title">姓名</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <input class="weui-input" auto-focus placeholder="请输入您的姓名"/>
        </view>
      </view>
      <view class="weui-cells__title">电话</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <input class="weui-input" auto-focus placeholder="请输入您的联系方式"/>
        </view>
      </view>
      <view class="weui-cells__title">电话</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <radio-group class="group" @change="radioChange">
            <view  @click="radioChange(item)" class="items" v-for="(item,index) in radioItems" :key="index" :id="item.name">
              <radio class="item" :value="item.value" :checked="item.checked"></radio>
              <view class="label-2__icon">
                <view class="label-2__icon-checked" :style="item.checked ? 'opacity:1' : 'opacity:0'"></view>
              </view>
              <label class="label-2__text">
                <text>{{item.value}}</text>
              </label>
            </view>
          </radio-group>
        </view>
      </view>
      <view class="weui-cells__title">主营行业</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <input class="weui-input" auto-focus placeholder="请输入您的联系方式"/>
        </view>
      </view>
      <view class="weui-cells__title">城市</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <input class="weui-input" auto-focus placeholder="请输入您能服务的城市"/>
        </view>
      </view>
      <view class="weui-cells__title">微信号</view>
      <view class="weui-cells weui-cells_after-title">
        <view class="weui-cell weui-cell_input">
          <input class="weui-input" auto-focus placeholder="请输入您的微信号"/>
        </view>
      </view>
    </view>
    <button>加盟接单</button>
  </div>
</template>

<script>
  import { get } from '@/util'

  import CommentList from '@/components/CommentList'
  import Card from '@/components/card'
  export default {
    data () {
      return {
        comments: [],
        openid: '',
        userinfo: {},
        user: 'user',
        books: [],
        radioItems: [
          {name: 'enterprise', value: '企业'},
          {name: 'individual', value: '个体'},
          {name: 'personal', value: '个人', checked: 'true'}
        ]
      }
    },
    components: {
      CommentList,
      Card
    },
    methods: {
      radioChange (e) {
        var checked = e.value
        for (var i = 0; i < this.radioItems.length; i++) {
          if (checked.indexOf(this.radioItems[i].value) !== -1) {
            this.radioItems[i].checked = true
          } else {
            this.radioItems[i].checked = false
          }
        }
        console.log(this.radioItems)
      },
      init () {
        wx.showNavigationBarLoading()
        this.GetComments()
        this.getBooks()
        wx.hideNavigationBarLoading()
        // 停止当前页面下拉刷新
        wx.stopPullDownRefresh()
      },
      async getBooks () {
        const books = await get('/weapp/booklist', {
          openid: this.userinfo.openId
        })
        this.books = books.list
      },
      async GetComments () {
        const comments = await get('/weapp/commentlist', {
          openid: this.userinfo.openId
        })
        this.comments = comments.list
      }
    },
    // 头部向下拉加载
    async onPullDownRefresh () {
      this.init()
    },
    onShow () {
      if (!this.userinfo.openId) {
        let userinfo = wx.getStorageSync('userinfo')
        console.log(userinfo)
        if (userinfo) {
          this.userinfo = userinfo
          this.init()
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
.joinUs{
    background: #f1f2f6;
    width: 100%;
  .join-img{
    width: 96%;
    display: block;
    margin: 0 auto 20rpx;
  }
  .name{
    width: 100%;
    background: #ddd;
    .name-item{
      color: #eee;
      font-size: 34rpx;
      line-height: 56rpx;
    }
  }
}
.weui-cells__title {
  margin:10rpx 0;
  padding-left:30rpx;
  padding-right:30rpx;
  color:#999999;
  font-size:14px;
}
.weui-cells {
  margin-top:1.17647059em;
  background-color:#FFFFFF;
  line-height:1.5;
  font-size:24rpx;
}
.weui-cells_after-title {
  margin-top:0;
}
.weui-cell_input {
  padding-top:0;
  padding-bottom:0;
}
.weui-cell {
  padding:0 30rpx;
  position:relative;
  display:-webkit-box;
  display:-webkit-flex;
  display:flex;
  -webkit-box-align:center;
  -webkit-align-items:center;
  align-items:center;
}
.weui-input {
  height:80rpx;
  font-size: 30rpx;
  min-height:80rpx;
  width: 80%;
  line-height:80rpx;
  color: #292d33;
}
.group{
  display: flex;
  display: -webkit-flex;
  width: 100%;
  line-height: 80rpx;
  .items{
    flex: 1;
    .item{
      display: none;
      opacity: 0;
    }
    .label-2__icon {
      position: relative;
      display: inline-block;
      vertical-align: middle;
      margin-right: 10px;
      width: 18px;
      height: 18px;
      background: #fcfff4;
      border-radius: 50px;
      border: 2rpx solid #ccc;
      .label-2__icon-checked {
        position: absolute;
        left: 3px;
        top: 3px;
        width: 12px;
        height: 12px;
        background: #1aad19;
        border-radius: 50%;
      }
    }
    .label-2__text {
      display: inline-block;
      vertical-align: middle;
    }
  }
}



</style>

