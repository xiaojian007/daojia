<template>
  <div class="myfav ico border-b" @click="toUrl(dataName.url)">
    <div class="ico-top"></div>
    <div class="ico-bottom"></div>
    <a class="ico-a">
      {{dataName.name}}
      <p class="ico-p">{{dataName.title}}<i class="ico-r">></i></p>
    </a>
  </div>
</template>

<script>
export default {
  props: [
    'dataName'
  ],
  methods: {
    async toUrl (url) {
      wx.navigateTo({
        url: url,
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
.border-b{
  position: relative;
  width: 100%;
  background: #fff;
  .ico-top{
    position: absolute;
    bottom: -2rpx;
    left: 0;
    display: block;
    width: 100%;
    height: 2rpx;
    background: #f1f2f6;
    content: "";
    -webkit-transform: scaleY(.5);
    -webkit-transform-origin: 0 0;
    z-index: 1;
  }
  .ico-bottom{
    position: absolute;
    bottom: -2rpx;
    left: 0;
    display: block;
    width: 100%;
    height: 2rpx;
    background: #f1f2f6;
    content: "";
    -webkit-transform: scaleY(.5);
    -webkit-transform-origin: 0 0;
    z-index: 1;
  }
  .ico-a{
    display: block;
    padding: 24rpx 30rpx;
    color: #292d33;
    font-size: 32rpx;
    line-height: 52rpx;
    .ico-r{
      display: inline-block;
      margin-left: 20rpx;
      font-family: 'SimSun';
      float: right;
    }
    .ico-p{
      position: absolute;
      top: 24rpx;
      right: 30rpx;
      color: #b2b8c2;
      font-size: 28rpx;
      .ico-r{
        display: inline-block;
        margin-left: 20rpx;
        font-family: 'SimSun'
      }
    }
  }
}
</style>

