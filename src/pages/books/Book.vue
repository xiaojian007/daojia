<template>
  <div>
    <TopSwiper :tops="tops"></TopSwiper>
    <card v-for="book in books" :key="book.id" :book="book"></card>
    <p v-if="!more" class="text-footer">没有更多数据...</p>
  </div>
</template>

<script>
  import { get } from '@/util'
  
  import card from '@/components/card'
  import TopSwiper from '@/components/Topswiper'
  // import { constants } from 'http2'
  export default {
    data () {
      return {
        books: [],
        page: 0,
        more: false,
        tops: []
      }
    },
    components: {
      card,
      TopSwiper
    },
    methods: {
      async getList (init) {
        if (init) {
          this.page = 0
          this.more = true
        }
        // 在当前页面显示导航条加载动画
        wx.showNavigationBarLoading()
        const books = await get('/weapp/booklist', {page: this.page})
        if (books.list.length < 10 && this.page > 0) {
          this.more = false
        }
        if (init) {
          // 数据覆盖第一页数据
          this.books = books.list
          // 停止当前页面下拉刷新
          wx.stopPullDownRefresh()
        } else {
          // 数据累加进去
          this.books = this.books.concat(books.list)
        }
        // 在当前页面隐藏导航条加载动画
        wx.hideNavigationBarLoading()
      },
      async getTop () {
        const tops = await get('/weapp/top')
        this.tops = tops.list
      }
    },
    // 头部向下拉加载
    async onPullDownRefresh () {
      this.getList(true)
      this.getTop()
    },
    // 底部向上拉加载
    onReachBottom () {
      if (!this.more) {
        return false
      }
      this.page = this.page + 1
      this.getList()
    },
    mounted () {
      this.getList(true)
      this.getTop()
    }
  }
</script>
