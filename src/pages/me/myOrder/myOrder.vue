<template>
  <div class="order">
    <div class="tab">
      <div class="tab-item" :class="{'cur': current==0}" @click="order(0)">待确认<i class="item-line"></i></div>
      <div class="tab-item" :class="{'cur': current==1}" @click="order(1)">待服务<i class="item-line"></i></div>
      <div class="tab-item" :class="{'cur': current==2}" @click="order(2)" >待支付<i class="item-line"></i></div>
      <div class="tab-item" :class="{'cur': current==3}" @click="order(3)">待评价<i class="item-line"></i></div>
      <div class="tab-item" :class="{'cur': current==4}" @click="order(4)">全部<i class="item-line"></i></div>
    </div>
    <swiper class="swiper" @change="switchItem('switchItem',$event)" :current="current" :indicator-dots="indicatorDots" :autoplay="autoplay" :interval="interval" :duration="duration">
      <block v-for="(item, index) in images" :key="index">
          <swiper-item>
              <image :src="item.url" class="slide-image" mode="aspectFill"/>
          </swiper-item>
      </block>
    </swiper> 
  </div>
</template>

<script>
export default {
  data () {
    return {
      indicatorDots: true,
      autoplay: false,
      interval: 3000,
      duration: 500,
      current: 1,
      images: [
        {url: 'https://img-oss.yunshanmeicai.com/goods/default/e83c8f0f-4acc-4729-bcbb-294f2b314977.jpg'},
        {url: 'https://img-oss.yunshanmeicai.com/goods/default/e83c8f0f-4acc-4729-bcbb-294f2b314977.jpg'},
        {url: 'https://img-oss.yunshanmeicai.com/goods/default/e83c8f0f-4acc-4729-bcbb-294f2b314977.jpg'},
        {url: 'https://img-oss.yunshanmeicai.com/goods/default/e83c8f0f-4acc-4729-bcbb-294f2b314977.jpg'},
        {url: 'https://img-oss.yunshanmeicai.com/goods/default/e83c8f0f-4acc-4729-bcbb-294f2b314977.jpg'}
      ]
    }
  },
  methods: {
    switchItem (current, fn) {
      console.log(current, fn)
      this.current = fn.mp.detail.current
    },
    order (item) {
      this.current = item
    }
  },
  onLoad (options) {
    console.log(options.id)
    this.current = options.id
  }
}
</script>

<style scoped lang="scss">
.order{
  width: 100%;
  .tab{
    display: flex;
    width: 100%;
    display: -webkit-flex;
    background-color: #fff;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 5;
    .tab-item{
      flex: 1;
      display: block;
      text-align: center;
      color: #525a66;
      line-height: 80rpx;
      height: 80rpx;
      font-size: 28rpx;
    }
    .cur{
      position: relative;
      color: #e6454a;
      background: #f8f8f8;
      .item-line{
        z-index: 1;
        position: absolute;
        left: 50%;
        bottom: 0;
        content: "";
        display: block;
        width: 60%;
        height: 2px;
        margin-left: -30%;
        background-color: #e6454a;
      }
    }
  }
  .swiper {
    margin-top: 80rpx;
    height: 376rpx !important;
  }
  image {
    height: 100%;
    width: 100%;
  }
}
</style>