<template>
  <div class="repair">
    <div class="sdDredge">
      <h2 class="repairTit">
        <strong></strong>
        <span>水电疏通</span>
      </h2>
      <div class="sdDredgeUl">
        <ul>
          <li>
            <i class="iconfont icon-guandaoshutong iconColor1"></i>
            <p>管道疏通</p>
          </li>
          <li>
            <i class="iconfont icon-shuiguanlongtou iconColor2"></i>
            <p>水管龙头</p>
          </li>
          <li>
            <i class="iconfont icon-dengjudianlu iconColor3"></i>
            <p>灯具电路</p>
          </li>
          <li>
            <i class="iconfont icon-fangshuizhilou iconColor4"></i>
            <p>防水治漏</p>
          </li>
          <li>
            <i class="iconfont icon-weishengjianshenduqingjie iconColor5"></i>
            <p>厨卫洁具</p>
          </li>
        </ul>
        <div class="repairLine"></div>
      </div>
    </div>
    <div class="sdDredge">
      <h2 class="repairTit">
        <strong></strong>
        <span>开锁换锁</span>
      </h2>
      <div class="sdDredgeUl">
        <ul>
          <li>
            <i class="iconfont icon-kaisuo iconColor1"></i>
            <p>开锁</p>
          </li>
          <li>
            <i class="iconfont icon-genghuansuoxin iconColor2"></i>
            <p>更换锁芯</p>
          </li>
          <li>
            <i class="iconfont icon-genghuanzhengtisuo iconColor3"></i>
            <p>更换整套锁</p>
          </li>
          <li>
            <i class="iconfont icon-genghuanmenbashou iconColor4"></i>
            <p>更换门把手</p>
          </li>
          <li>
            <i class="iconfont icon-genghuansuoti iconColor5"></i>
            <p>更换锁体</p>
          </li>
          <li>
            <i class="iconfont icon-genghuanzhiwensuo iconColor6"></i>
            <p>更换指纹锁</p>
          </li>
          <li>
            <i class="iconfont icon-baoxianxiangkaisuo iconColor7"></i>
            <p>保险箱开锁</p>
          </li>
          <li>
            <i class="iconfont icon-qichekaisuo iconColor8"></i>
            <p>汽车开锁</p>
          </li>
        </ul>
        <div class="repairLine"></div>
      </div>
    </div>
    <div class="sdDredge">
      <h2 class="repairTit">
        <strong></strong>
        <span>家电维修</span>
      </h2>
      <div class="sdDredgeUl">
        <ul>
          <li>
            <i class="iconfont icon-kongtiaojiafu iconColor1"></i>
            <p>空调加氟</p>
          </li>
          <li>
            <i class="iconfont icon-kongtiaoyiji iconColor2"></i>
            <p>空调移机安装</p>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
  import { get } from '@/util'
  
  export default {
    data () {
      return {
        books: [],
        page: 0,
        more: false,
        tops: []
      }
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
    },
    // 底部向上拉加载
    onReachBottom () {
    },
    mounted () {
    }
  }
</script>

<style lang="scss">
.repairTit {
  text-align: left;
  color: #333;
  font-weight: normal;
  padding: 2% 0 2% 0;
  font-size: 20px;
  border-bottom: 1px solid #dedede;

  strong {
    width: 5px;
    background: #3c7bf9;
    height: 16px;
    vertical-align: middle;
    margin-right: 2%;
    display: inline-block;
  }

  span {
    vertical-align: middle;
  }
}

.sdDredgeUl {
  ul {
    display: flex;
    flex-wrap: wrap;
    align-content: flex-start;

    li {
      border-bottom: 1px solid #dedede;
      border-right: 1px solid #dedede;
      box-sizing: border-box;
      flex: 0 0 33.3333333%;
      padding: 5% 0;
      text-align: center;
      font-size: 16px;

      &:nth-child(3n) {
        border-right: 0;
      }
    }
  }

  .repairLine {
    height: 6px;
    background: #ebebeb;
    margin-top: -1px;
    position: relative;
    z-index: 999;
  }
}
</style>

