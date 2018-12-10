<template>
  <div class="progressbar">
    <progress :percent="percent" activeColor="#ea5a49" border-radius="20rpx" active="true" />
    <p>{{year}}已经过去{{days}}天， {{percent}}%</p>
  </div>
</template>

<script>
  export default {
    data () {
      return {}
    },
    methods: {
      isLeapYear () {
        const year = new Date().getFullYear()
        if (year % 400 === 0) {
          return true
        } else if (year % 4 === 0 && year % 100 !== 0) {
          return true
        } else {
          return false
        }
      },
      getDayOfYear () {
        return this.isLeapYear() ? 366 : 365
      }
    },
    computed: {
      year () {
        return new Date().getFullYear()
      },
      days () {
        let start = new Date()
        start.setMonth(0)
        start.setDate(1)
        // start就是今年的第一天
        // 今天的时间戳减去今年的第一天的时间戳
        let offset = new Date().getTime() - start.getTime()
        return parseInt(offset / 1000 / 60 / 60 / 24) + 1
      },
      percent () {
        return (this.days * 100 / this.getDayOfYear()).toFixed(1)
      }
    }
  }
</script>

<style lang="scss">
.progressbar{
  text-align: center;
  margin: 10rpx 0 40rpx 0;
  width: 100%;
  progress{
    margin-bottom: 10rpx;
  }
}
</style>

