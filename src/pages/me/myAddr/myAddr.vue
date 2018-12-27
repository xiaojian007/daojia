<template>
  <div class="addr">
    <div class="addr-item" v-for="(item, index) in addrList" :key="index">
      <h3 class="item-title">{{item.addr}}</h3>
      <div class="item-name">
        <span class="name">{{item.name}}</span>
        <span class="iphone">{{item.iphone}}</span>
      </div>
      <div @click="addAddr(item)" class="icon">
        <i class="icon-wodedingdan iconfont"></i>
      </div>
    </div>
    <button @click="addAddr" class="addAddr btn">+ 新整地址</button>
  </div>
</template>
<script>
export default {
  data () {
    return {
      addrList: [
        {
          id: 0,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 1,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 2,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 3,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 4,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }, {
          id: 5,
          name: '小贱',
          addr: '佳宝新村1开经理6栋666室',
          iphone: '16666666666'
        }
      ]
    }
  },
  methods: {
    addAddr (item) {
      let params = {
        id: item.id,
        name: item.name,
        addr: item.addr,
        iphone: item.iphone
      }
      wx.navigateTo({
        url: 'addAddr/main?dataObj=' + JSON.stringify(params),
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
    }
  }
}
</script>
<style lang="scss" scoped>
  .addr{
    width: 100%;
    .addr-item{
      position: relative;
      border-bottom: 2rpx solid #e8e8e8;
      padding: 40rpx;
      .item-title{
        font-size: 32rpx;
        color: #000;
        line-height: 46rpx;
      }
      .icon{
        position: absolute;
        right: 40rpx;
        top: 50rpx;
        color: #ccc;
      }
      .item-name{
        font-size: 28rpx;
        color: #e8e8e8;
        line-height: 36rpx;
        margin-top: 10rpx;
        .name{
          display: inline-block;
          margin-right: 10rpx;
        }
        .iphone{
          display: inline-block;
        }
      }
    }
    .addAddr{
      position: fixed;
      bottom: 20rpx;
      left: 5%;
      width: 90%;
      font-size: 32rpx;
      font-weight: normal;
    }
  }
</style>
