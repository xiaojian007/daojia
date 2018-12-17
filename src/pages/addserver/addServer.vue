<template>
  <div class="repair">
    <div class="sdDredge" v-for="(item, index) in repairState" :key="index">
      <h2 class="repairTit">
        <strong></strong>
        <span>{{ item.name }}</span>
      </h2>
      <div class="sdDredgeUl">
        <ul>
          <li v-for="(item2,i) in item.context" :key="i" @click="toUrl(item.name, item2.contant)">
            <i class="iconfont iconColor1" :class="[item2.iconfont, item2.color]"></i>
            <p>{{ item2.contant }}</p>
          </li>
        </ul>
        <div class="repairLine"></div>
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
        tops: [],
        repairState: [{
          id: '0',
          name: '水电疏通',
          context: [{
            id: '0',
            iconfont: 'icon-guandaoshutong',
            contant: '管道疏通',
            color: 'iconColor1'
          },
          {
            id: '1',
            iconfont: 'icon-shuiguanlongtou',
            contant: '水管龙头',
            color: 'iconColor2'
          },
          {
            id: '2',
            iconfont: 'icon-dengjudianlu',
            contant: '灯具电路',
            color: 'iconColor3'
          },
          {
            id: '3',
            iconfont: 'icon-fangshuizhilou',
            contant: '防水治漏',
            color: 'iconColor4'
          },
          {
            id: '4',
            iconfont: 'icon-weishengjianshenduqingjie',
            contant: '厨卫洁具',
            color: 'iconColor5'
          }]
        },
        {
          id: '1',
          name: '开锁换锁',
          context: [{
            id: '0',
            iconfont: 'icon-kaisuo',
            contant: '开锁',
            color: 'iconColor1'
          },
          {
            id: '1',
            iconfont: 'icon-genghuansuoxin',
            contant: '更换锁芯',
            color: 'iconColor2'
          },
          {
            id: '2',
            iconfont: 'icon-genghuanzhengtisuo',
            contant: '更换整套锁',
            color: 'iconColor3'
          },
          {
            id: '3',
            iconfont: 'icon-genghuanmenbashou',
            contant: '更换门把手',
            color: 'iconColor4'
          },
          {
            id: '4',
            iconfont: 'icon-genghuansuoti',
            contant: '更换锁体',
            color: 'iconColor5'
          },
          {
            id: '5',
            iconfont: 'icon-genghuanzhiwensuo',
            contant: '更换指纹锁',
            color: 'iconColor6'
          },
          {
            id: '6',
            iconfont: 'icon-baoxianxiangkaisuo',
            contant: '保险箱开锁',
            color: 'iconColor7'
          },
          {
            id: '7',
            iconfont: 'icon-qichekaisuo',
            contant: '汽车开锁',
            color: 'iconColor8`'
          }]
        },
        {
          id: '2',
          name: '家电维修',
          context: [{
            id: '0',
            iconfont: 'icon-kongtiaojiafu',
            contant: '空调加氟',
            color: 'iconColor1'
          },
          {
            id: '1',
            iconfont: 'icon-kongtiaoyiji',
            contant: '空调移机安装',
            color: 'iconColor2'
          }]
        }]
      }
    },
    methods: {
      async getRepair () {
        const Repair = await get('/weapp/repair')
        // this.repairState = Repair.list
        console.log(Repair.list)
        console.log(this.repairState)
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
      async getTop () {
        const tops = await get('/weapp/top')
        this.tops = tops.list
      },
      toUrl (name, contant) {
        console.log(name, contant)
        wx.navigateTo({
          url: '../../pages/books/appointment/main?name=' + name + '&contant' + contant,
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
      }
    },
    // 头部向下拉加载
    async onPullDownRefresh () {
    },
    // 底部向上拉加载
    onReachBottom () {
    },
    mounted () {
      this.getRepair()
    }
  }
</script>

<style lang="scss">
.repairTit {
  text-align: left;
  color: #333;
  font-weight: normal;
  padding: 2% 0 2% 0;
  font-size: 40rpx;
  border-bottom: 2rpx solid #dedede;

  strong {
    width: 10rpx;
    background: #3c7bf9;
    height: 36rpx;
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
      border-bottom: 2rpx solid #dedede;
      border-right: 2rpx solid #dedede;
      box-sizing: border-box;
      flex: 0 0 33.3333333%;
      padding: 5% 0;
      text-align: center;
      font-size: 32rpx;
      &:nth-child(3n) {
        border-right: 0;
      }
      a {
        color: #333;
      }
    }
  }

  .repairLine {
    height: 12rpx;
    background: #ebebeb;
    margin-top: -2rpx;
    position: relative;
    z-index: 999;
  }
}

.repairSuccessTop {
  padding: 10% 0;
  text-align: center;
  color: #1b85e9;
  font-size: 40rpx;
  border-bottom: 12rpx solid #ebebeb;

  i {
    display: block;
    font-size: 85px;
  }
}

.repairSuccessContent {
  padding: 2% 4%;

  p {
    padding: 2% 0;
    color: #555;
    font-size: 32rpx;
    display: flex;

    span {
      width: 30%;
    }
  }
}

.repairSuccessbtn {
  display: flex;
  margin-top: 15%;
  text-align: center;
  align-content: space-around;

  .Successbtn {
    color: #fff;
    font-size: 20px;
    border: none;
    padding: 1.5% 0;
    border-radius: 14rpx;
    margin: 0 2%;
    background: #ff5622;
    display: block;
    flex: 1;

    &.Successbtn1 {
      background: #fff;
      border: 1px solid #ff5622;
      color: #ff5622;
    }
  }
}
</style>

