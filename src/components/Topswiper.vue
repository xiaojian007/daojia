<template>
  <div class="swiper">
    <swiper 
      indicator-dots='true'
      indicator-color='#fff'
      indicator-active-color="#049efe"
      autoplay='true'
      interval="6000"
      duration="1000"
      circular="true"
    >
      <div v-for="(top, index) in tops" :key="index">
        <swiper-item>
          <img 
            @click="bookDetail(top.id, top.url)"
            :src="top.img" 
            alt="" 
            mode="widthFix"
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
      }
    },
    methods: {
      bookDetail (item) {
        // wx.navigateTo({
        //   url: '/pages/detail/main?id=' + item.id
        // })
      }
    },
    computed: {
    },
    mounted () {
      // console.log(tops)
    },
    props: [
      'tops'
    ]
  }
</script> 

<style lang="scss">
</style>

