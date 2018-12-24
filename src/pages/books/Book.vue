<template>
  <div class="baojie">
    <!-- 保洁次数 -->
    <div class="baojie-top">
      <img class="top-img" src="../../../static/img/bjbg.jpg" mode="widthFix" alt="">
      <div class="baojie-free">您的免费保洁服务还剩余
        <span>10</span> 次</div>
    </div>
    <margin :value="20"></margin>
    <!-- 保洁1 -->
    <div class="baojieList1">
      <ul>
        <li v-for="(item, index) in baojie" :key="index" @click="yuyue(item.id, item.contant)">
          <i class="iconfont iconColor1" :class="[item.iconfont, item.color]"></i>
          <p>{{ item.contant }}</p>
        </li>
      </ul>
    </div>
    <margin :value="20"></margin>
    <!-- 保洁2 -->
    <div class="baojieList1">
      <ul>
        <li v-for="(item, index) in baojie2" :key="index" @click="yuyue(item.id, item.contant)">
          <i class="iconfont iconColor1" :class="[item.iconfont, item.color]"></i>
          <p>{{ item.contant }}</p>
        </li>
      </ul>
    </div>
    <margin :value="20"></margin>
    <!-- 轮播图 -->
    <div class="baojieSwpier">
      <TopSwiper :tops="tops"></TopSwiper>
    </div>
    <margin :value="20"></margin>
    <!-- 组合套餐 -->
    <div class="baojieBox">
      <div class="baojieContent">
        <h2 class="conH2">推荐服务</h2>
        <div class="baojieList">
          <div class="baojieItem" v-for="(item, index) in taocanlist" :key="index">
            <div class="baojieListLeft" @click.stop="preview(item.img)">
              <img class="itemImg" :src="item.img" mode="widthFix" alt="">
            </div>
            <div class="baojieListRight">
              <p class="baojieP">{{item.title}}</p>
              <span class="baojieSpan">{{item.content}}</span>
              <div class="baojieA">
                <div class="baojieAs">￥{{item.price}}<i class="price">起</i></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- LoadMore 页底提示 -->
    <!-- <i-load-more /> -->
    <i-load-more tip="暂无更多数据" :loading="false" />
  </div>
</template>

<script>
  import margin from '@/components/margin'
  import TopSwiper from '@/components/Topswiper'
  import { get } from '@/util'
  export default {
    data () {
      return {
        books: [],
        page: 0,
        more: false,
        tops: [],
        baojie: [],
        baojie2: [],
        taocanlist: []
      }
    },
    components: {
      margin,
      TopSwiper
    },
    methods: {
      async getRepair () {
        const Home = await get('/weapp/homelist')
        const HomeList = Home.list
        this.tops = HomeList.swiperList
        this.taocanlist = HomeList.setmealList
        this.baojie = HomeList.cleaningList
        this.baojie2 = HomeList.projectList
      },
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
      yuyue (id, contant) {
        wx.navigateTo({
          url: '../../pages/addserver/appointment/main?id=' + id + '&contant=' + contant,
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
      },
      preview (img) {
        wx.previewImage({
          current: img, // 当前显示图片的链接，不填则默认为 urls 的第一张
          urls: [img, img, img], // 可以接口提供多个图片达到轮播的效果
          success (res) {
            // success
            console.log(img)
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
    // 头部向下拉加载
    async onPullDownRefresh () {
      console.log(1)
    },
    // 底部向上拉加载
    onReachBottom () {
    },
    mounted () {
      this.getRepair()
      console.log(wx.getStorageSync('userinfo'))
    }
  }
</script>

<style lang="scss">
.baojie {
  &-top {
    width: 100%;
    position: relative;
    text-align: center;
    .top-img {
      width: 100%;
    }
    .baojie-free {
      position: absolute;
      width: 100%;
      left: 0;
      bottom: 2%;
      color: #fff;
      font: 200 24rpx/1 '';

      span {
        display: inline-block;
        color: #F49C23;
        font-weight: 400;
        background: #fff;
        border-radius: 50%;
        width: 48rpx;
        height: 48rpx;
        line-height: 48rpx;
      }
    }
  }
}

.baojieSwpier{
  .swiper{
    height: 210rpx;
    ._swiper{
      height: 210rpx;
      .slide-image{
        width: 100%;
      }
    }
  }
}

.baojieList1 ul {
  display: flex;
  flex-wrap: wrap;
  align-content: flex-start;
  li {
    box-sizing: border-box;
    flex: 0 0 33.3333333%;
    padding: 1% 0;
    text-align: center;
    font-size: 16px;
    a {
      color: #333;
    }
  }
}

.baojieBox {
  padding: 0 3%;
  // background: #f1f2f6;
  .baojieContent {
    background: #fff;
    border-radius: 20rpx;
    .conH2 {
      color: #1B85E9;
      font-size: 40rpx;
      font-weight: bold;
      text-align: center;
      padding: 20rpx 0;
    }

    .baojieItem {
      display: flex;
      justify-content: flex-start;
      padding: 3%;
      // border-bottom: 2rpx solid #dedede;
      :last-child{
        border-bottom: 0;
      }
      .baojieListLeft {
        width: 30%;
        .itemImg{
          border-radius: 5%;
        }
      }

      .baojieListRight {
        width: 65%;
        margin-left: 5%;
        position: relative;
        color: #333;
        font-size: 32rpx;
        .baojieSpan {
          color: #9a9a9a;
          font-size: 24rpx;
        }

        .baojieA{
          position: absolute;
          left: 5rpx;
          bottom: 5rpx;
          .baojieAs {
            font-size: 32rpx;
            color: #ff5622;
            font-weight: bold;
            display: block;
            .price{
              display: inline-block;
              font-size: 20rpx;
              margin-left: 8rpx;
            }
          }
        }
      }
    }
  }
}
</style>

