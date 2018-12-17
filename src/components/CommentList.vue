<template>
  <div class="comment-list">
    <div class="page-title" v-if='comments.length'>
      相关评论
    </div>
    <div class="comment"
        v-for='comment in comments' 
        :key='comment.id'
        @click="handleClick(comment)"
        >
      <div class="user">
        <div class="inline">
          <img :src="comment.image" 
                class="avatar"
                mode='aspectFit'
            >
          {{comment.title}}
          <span class="right" v-if="comment.times">发表时间：{{comment.times}}</span>
        </div>
        <div class="right">
          {{comment.location||'未知地点'}}
          <span class="text-primary">
            --
          </span>
          {{comment.phone||'未知型号'}}
        </div>
      </div>
      <div class="content">
        {{comment.comment}}
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },
  props: ['comments', 'type'],
  methods: {
    handleClick (item) {
      if (this.type === 'user') {
        wx.navigateTo({
          url: '/pages/detail/main?id=' + item.bookid,
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
    }
  }
}
</script>

<style lang='scss'>
.comment-list{
  width: 94%;
  margin: 20rpx auto;
  // background:#eee;
  font-size:28rpx;
  .comment{
    // background: white;
    background:#eee;
    margin-bottom:10px;
    padding:5px 20px;
    .content{
      margin:10rpx 0;
    }
    .user{
      padding: 10rpx;
      .inline{
        display:inline;
        font-size: 24rpx;
        .right{
          float: right;
          font-size: 24rpx;
        }
        .avatar{
          width:40rpx;
          height:40rpx;
          border-radius: 50%;
          margin-right: 10rpx;
          vertical-align:middle;
        }
      }

    }

  }

}
</style>

