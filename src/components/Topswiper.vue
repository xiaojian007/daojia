<template>
  <div class="swiper">
    <swiper 
      indicator-dots='true'
      indicator-color='#ea5a49'
      indicator-active-color="#000"
      autoplay='true'
      interval="6000"
      duration="1000"
      circular="true"
    >
      <div v-for="(top, index) in imgUrls" :key="index">
        <swiper-item>
          <img 
            @click="bookDetail(img)"
            :src="img.image" 
            alt="" 
            v-for="(img,indexs) in top"
            :key="indexs"
            mode="aspectFit" 
            class="slide-image"
          >
        </swiper-item>
      </div>
    </swiper>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        tops: []
      }
    },
    methods: {
      bookDetail (item) {
        wx.navigateTo({
          url: '/pages/detail/main?id=' + item.id
        })
      }
    },
    computed: {
      imgUrls () {
        let res = this.tops
        return [res.slice(0, 3), res.slice(3, 6), res.slice(6, 9)]
      }
    },
    mounted () {
      // console.log(this.imgUrls)
    },
    props: [
      'tops'
    ]
  }
</script> 

<style lang="scss">
.swiper{
  margin-top: 10rpx;
  .slide-image{
    width: 33%;
    height: 250rpx;
  }
}
</style>

