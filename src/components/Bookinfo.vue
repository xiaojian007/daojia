<template>
  <div class='bookinfo'>
    <div class="thumb">
      <img class='back' 
        :src="info.image"
        mode='aspectFill'>
      <img class="img"  
            :src="info.image" 
            mode='aspectFit'
          >
      <div class="info">
        <div class="title">
          {{info.title}}
        </div>
        <div class="author">
          {{info.author}}
        </div>
      </div>
    </div>
    <div class="detail">
      <img :src="userinfo.image" class='avatar' mode='aspectFit'>
      {{userinfo.name}}
      <div class="right text-primary">
        <Rate :value="info.rate"></Rate>
        {{info.rate}}分
      </div>
    </div>
    <div class="detail">
      {{info.publisher}}
      <div class="right">
        {{info.price}}
      </div>
    </div>
    <div class="tags">
      <div class="badge" :key='i' v-for='(tag, i) in info.tags'>{{tag}}</div>
    </div>
    <div class="summary">
      <p :key='i' v-for='(sum, i) in info.summary'>{{sum}}</p>
    </div>
  </div>
</template>

<script>
  import Rate from '@/components/rate.vue'
  export default {
    data () {
      return {
      }
    },
    components: {
      Rate
    },
    props: ['info'],
    computed: {
      userinfo () {
        return this.info.user_info || {}
      }
    }
  }
</script>
<style lang='scss'>
.bookinfo{
  font-size: 28rpx;
  .badge{
    display: inline-block;
    margin:10rpx;
    padding:10rpx;
    border-radius: 20rpx;
    border:2rpx #EA5A49 solid;
    color:#EA5A49;
  }
  .summary{
    padding:0 30rpx;
    margin-top:20rpx;
    p{
      text-indent: 2em;
      font-size:28rpx;
    }
  }
  .right{
    float: right;
  }
  .detail{
    padding:10rpx 20rpx;
    .avatar{
      width:40rpx;
      height:40rpx;
      border-radius: 50%;
      vertical-align: middle;
    }
  }
  .thumb{
    width:750rpx;
    height:500rpx;
    overflow:hidden;
    position: relative;
    .back{
      filter: blur(30rpx);
      width:100%;
    }
    .img{
      position: absolute;
      width:100%;
      height:300rpx;
      left:0;
      top:30rpx;
    }
    .info{
      color:white;
      position: absolute;
      width:100%;
      left:0;
      top:330rpx;
      text-align: center;
      .title{
        font-size:40rpx;
      }
      .author{
        font-size: 28rpx;
      }

    }
  }
}
</style>
