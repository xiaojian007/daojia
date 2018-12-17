<template>
  <div class="commonMargin"  :style='style'></div>
</template>

<script>
export default {
  props: {
    value: {type: [Number, String], default: '0'}
  },
  computed: {
    style () {
      return `height:${this.value}rpx`
    }
  }
}
</script>

<style lang="scss" scoped>
  .commonMargin{
    background: #f1f2f6;
  }
</style>

