<template>
  <div class="address">
    <div class="addItem">
      <span>联系人</span>
      <input class="weui-input" auto-focus placeholder="姓名" v-model="item.name" />
    </div>
    <div class="addItem">
      <span>手机号</span>
      <input class="weui-input" auto-focus placeholder="姓名" v-model="item.iphone" />
    </div>
    <div class="addItem">
      <span>服务地址</span>
      <input class="weui-input" auto-focus placeholder="姓名" v-model="item.addr" />
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
    }
  },
  onLoad (options) {
    const item = JSON.parse(options.dataObj)
    console.log(item)
  }
}
</script>
