<template>
  <a :href="detailUrl">
    <div class="book-card">
      <div class="thumb" @click.stop="preview">
        <img :src="book.image" class="img" alt="" mode="aspectFit">
      </div>
      <div class="detail">
        <div class="row text-primary">
          <div class="right">
            <i class=" rowss">{{book.rate}} </i>
            <rate :value="book.rate"></rate>
          </div>
          <div class="left">
            {{book.title}}
          </div>
        </div>
        <div class="row">
          <div class="right text-primary">
            浏览量:{{book.count}}
          </div>
          <div class="left">
            {{book.author}}
          </div>
        </div>
        <div class="row">
          <div class="right">
          上传者：{{book.user_info.nickName}}
          </div>
          <div class="left">
          {{book.publisher}}
          </div>
        </div>
      </div>
    </div>
  </a>
</template>

<script>
import rate from '@/components/rate'

export default {
  props: ['book'],
  methods: {
    preview () {
      wx.previewImage({
        current: this.book.image, // 当前显示图片的链接，不填则默认为 urls 的第一张
        urls: [this.book.image], // 可以接口提供多个图片达到轮播的效果
        success (res) {
          // success
        },
        fail () {
          // fail
        },
        complete () {
          // complete
        }
      })
    }
  },
  components: {
    rate
  },
  computed: {
    detailUrl () {
      return '/pages/detail/main?id=' + this.book.id
    }
  }
}
</script>

<style lang='scss' scoped>
.book-card{
  padding:5px;
  overflow: hidden;
  margin-top:5px;
  margin-bottom:5px;
  .thumb{
    width:180rpx;
    height:180rpx;
    border-radius: 10rpx;
    float: left;
    margin:0 auto;
    overflow:hidden;
    .img{
      max-width: 100%;
      max-height: 100%;
    }
  }
  .detail{
    margin-left: 200rpx;
    margin-right: 20rpx;
    margin-top: 10rpx;
    font-size: 24rpx;
    .row{
      line-height:40rpx;
      margin-bottom:3px;
      .rowss{
        color: #f00;
        display: inline-block;
        margin-right: 10rpx;
      }
    }
    .right{
      float: right;
    }
    .left{
      margin-right:80px;
    }
  }
  
}
</style>