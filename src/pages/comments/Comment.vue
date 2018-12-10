<template>
  <div>
    <CommentList :type="user" :comments="comments"></CommentList>
    <div v-if="userinfo.openId"> 
      <div class="page-title">我的图书</div>
      <Card v-for="book in books" :key="book.id" :book="book"></Card>
    </div>
    <div class="text-footer" v-if="!books.length">您尚未添加图片，快去添加图书</div>
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
        books: []
      }
    },
    components: {
      CommentList,
      Card
    },
    methods: {
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
.page-title{
  width: 94%;
  margin: 0 auto;
}
</style>

