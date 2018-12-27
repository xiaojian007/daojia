<template>
  <div class="yuyue mvpue-picker">
    <h3>预约{{dronProject}}</h3>
    <div class="yuyue-list">

      <div class="xuanze">
        <span class="title">您的称呼</span>
        <input class="type" type="text" placeholder="请输入您的姓名" v-model="name">
      </div>

      <div class="xuanze">
        <span class="title">联系方式</span>
        <input class="type" type="text" placeholder="请输入您的手机号码" v-model="phone">
        <button v-if="getIphone" class="getIphone" open-type="getPhoneNumber" @getphonenumber="getPhoneNumber">号码授权</button>
      </div>

      <div class="xuanze">
        <span class="title">选择项目</span>
        <div class="type" @click="showSinglePicker(1)">{{dronProject}}<span class="typeSpan"></span></div>
      </div>

      <div class="xuanze">
        <span class="title">预约时间</span>
        <div class="type" @click="showMulLinkageThreePicker">{{dronTime}}<span class="typeSpan"></span></div>
      </div>

      <div class="xuanze">
        <span class="title">地址</span>
        <input class="type" @input="addressChange" type="text" placeholder="请输入地址" v-model="address">
        <i class="address">*地址可在我的信息中更改</i>
        <div class="vague" v-if="addressArrayShow">
          <scroll-view 
            scroll-y
            v-if="addressArrayShow"
            style="max-height: 200rpx;"
            bindscrolltoupper="upper"
            bindscrolltolower="lower"
            bindscroll="scroll">
            <div class="vagueItem" @click="vagueMap(item.address)" v-for="(item, index) of addressArrayList" :key="index">{{item.address}}</div>
          </scroll-view>
        </div>
      </div>
      
      <div class="xuanze xuanze4">
        <textarea class="textarea" cols="3" placeholder="我要留言......" v-model="textarea">
        </textarea>
      </div>

      <!-- 下拉 -->
      <mpvue-picker ref="mpvuePicker" :mode="mode" :deepLength="deepLength" :pickerValueDefault="pickerValueDefault" :themeColor="themeColor" @onChange="onChange" @onConfirm="onConfirm" @onCancel="onCancel" :pickerValueArray="pickerValueArray"></mpvue-picker>
    </div>
    <p class="yy-notice">*预约成功后客服三十分钟内给您安排并向您回电确认.</p>
    <button class="yy-btn" @click="appointment">开始预约</button>
  </div>
</template>

<script>
import {showSuccess, newDate, post, showModal} from '@/util'
import mpvuePicker from '@/components/mpvuePicker.vue'
export default {
  components: {
    mpvuePicker
  },
  data () {
    return {
      mode: 'selector',
      deepLength: 0,
      name: '',
      getIphone: true,
      userinfo: {},
      pickerValueDefault: [], // 初始化值
      pickerValueArray: [], // picker 数组值
      dronProject: '请选择',
      dronTime: '请选择',
      phone: '',
      address: '宇宙国地球村中国1号',
      themeColor: '', // 颜色主题
      textarea: '',
      dronProjectArray: [
        {
          label: '日常保洁',
          value: 1
        },
        {
          label: '深度保洁',
          value: 2
        },
        {
          label: '开荒保洁',
          value: 3
        },
        {
          label: '保姆月嫂',
          value: 4
        },
        {
          label: '收纳',
          value: 5
        },
        {
          label: '外墙清洁',
          value: 6
        }
      ],
      dronTimeArray: [
        {
          label: '今天',
          value: 0,
          children: [
            {
              label: '06',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            }
          ]
        }, {
          label: '明天',
          value: 0,
          children: [
            {
              label: '06',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            }
          ]
        }, {
          label: '后天',
          value: 0,
          children: [
            {
              label: '06',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            },
            {
              label: '07',
              value: 1,
              children: [
                {
                  label: '00',
                  value: 1
                },
                {
                  label: '10',
                  value: 2
                },
                {
                  label: '20',
                  value: 3
                },
                {
                  label: '30',
                  value: 4
                },
                {
                  label: '40',
                  value: 5
                },
                {
                  label: '50',
                  value: 6
                }
              ]
            }
          ]
        }
      ],
      addressArray: [
        {
          id: 0,
          address: '上海'
        }, {
          id: 1,
          address: '北京'
        }, {
          id: 1,
          address: '北京'
        }, {
          id: 1,
          address: '北京'
        }, {
          id: 1,
          address: '北京'
        }, {
          id: 1,
          address: '北京'
        }, {
          id: 1,
          address: '北京'
        }
      ],
      addressArrayList: []
    }
  },
  methods: {
    onChange (e) {
      console.log(e)
    },
    onCancel (e) {
      console.log(e)
    },
    // 地址模糊查询
    addressChange () {
      var NewAddress = []
      this.addressArray.map(item => {
        if (item.address.search(this.address) !== -1 && this.address) {
          NewAddress.push(item)
        }
      })
      this.addressArrayList = NewAddress
    },
    // 下拉地址点击
    vagueMap (value) {
      // console.log(1)
      this.address = value
      this.addressArrayList = []
    },
    // 下拉
    showSinglePicker (item) {
      if (item === 0) {
        this.pickerValueArray = this.dronTypeArray
      } else if (item === 1) {
        this.pickerValueArray = this.dronProjectArray
      }
      this.mode = 'selector'
      this.pickerValueDefault = []
      this.deepLength = item
      this.$refs.mpvuePicker.show()
      this.themeColor = '#247FF6'
    },
    // 时间三级联动选择
    showMulLinkageThreePicker () {
      this.pickerValueArray = this.dronTimeArray
      this.mode = 'multiLinkageSelector'
      this.deepLength = 3
      this.pickerValueDefault = [1, 1, 1]
      this.themeColor = '#8D0177'
      this.$refs.mpvuePicker.show()
    },
    // 返回
    onConfirm (e) {
      console.log(e.label)
      if (this.mode === 'selector') {
        if (this.deepLength === 0) {
          this.dronType = e.label
        } else if (this.deepLength === 1) {
          this.dronProject = e.label
        }
      } else if (this.mode === 'multiLinkageSelector' && this.deepLength === 3) {
        let array = e.label.split('-')
        let time = new Date()
        const year = time.getFullYear()
        const month = time.getMonth() + 1
        let day = ''
        if (array[0] === '明天') {
          day = time.getDate() + 1
        } else if (array[0] === '后天') {
          day = time.getDate() + 2
        } else {
          day = time.getDate()
        }
        const hour = array[1]
        const minuter = array[2]
        this.dronTime = (year + '-' + month + '-' + day + ' ' + hour + ':' + minuter)
      }
    },
    // 预约提交
    async appointment () {
      const params = {
        name: this.name,
        subtime: newDate(new Date()),
        dronproject: this.dronProject,
        appointtime: this.dronTime,
        message: this.textarea,
        address: this.address,
        phonenub: this.phone
      }
      if (this.dronTime === '请选择') {
        showModal('预约失败', '请选择预约时间')
        return false
      } else if (this.phone === '') {
        showModal('预约失败', '请输入您的手机号码')
        return false
      } else if (this.address === '') {
        showModal('预约失败', '请属于您的地址')
        return false
      } else {
        try {
          const back = await post('/weapp/addappointment', params)
          showSuccess(back.msg)
          this.dronProject = '请选择'
          this.dronTime = '请选择'
          this.phone = ''
          this.address = ''
          this.textarea = ''
        } catch (e) {
          showModal('失败', e.msg)
        }
      }
    },
    // 手机号码权限获取 个人认证无法获取，需企业认证
    getPhoneNumber (e) {
      this.getIphone = false
      console.log(e)
      console.log(e.detail.errMsg)
      console.log(e.detail.iv)
      console.log(e.detail.encryptedData)
      if (e.detail.errMsg === 'getPhoneNumber:fail user deny') {
        wx.showModal({
          title: '提示',
          showCancel: false,
          content: '未授权',
          success  (res) { }
        })
      } else {
        wx.showModal({
          title: '提示',
          showCancel: false,
          content: '同意授权',
          success (res) { }
        })
      }
    }
  },
  computed: {
    addressArrayShow () {
      // console.log(this.addressArray.length > 0)
      // return (this.addressArray.length > 0) ? true : false
      if (this.addressArrayList.length > 0) {
        return true
      } else {
        return false
      }
    }
  },
  mounted () {
    this.dronProject = this.$root.$mp.query.contant
    // let userinfo = wx.getStorageSync('userinfo')
  }
}
</script>

<style lang="scss">
// 预约保洁
.yuyue {
  h3 {
    color: #1B85E9;
    text-align: center;
    font: 400 24px/1 '';
    padding: 8% 0 5%;
  }
  .yuyue-list {
    margin: 14rpx;
    .xuanze {
      display: flex;
      align-items: center;
      line-height: 100rpx;
      border-top: 1rpx solid #E8E8E8;
      padding-right: 15rpx;
      box-sizing: border-box;
      position: relative;
      z-index: 5;
      .title {
        color: #000;
        font-size: 32rpx;
        display: inline-block;
        width: 200rpx;
        text-align: center;
      }
      .type{
        color: #000;
        font-size: 32rpx;
        display: inline-block;
        flex: 1;
        position: relative;
        text-align: left;
        .typeSpan{
          width: 16rpx;
          height: 16rpx;
          border-right: 3rpx solid #c7c7c7;
          border-bottom: 3rpx solid #c7c7c7;
          position: absolute;
          top: 38rpx;
          right: 40rpx;
          transform: rotate(45deg);
          transition: transform 0.3s ease-out;
        }
      }
      .vague{
        position: absolute;
        top: 100rpx;
        z-index: 2;
        left: 200rpx;
        width: 100%;
        background: #fff;
        .vagueItem{
          font-size: 32rpx;
          line-height: 60rpx;
          color: #000;
        }
      }
      .address{
        font-style: normal;
        color: #ea9128;
        font-size: 26rpx;
        line-height: 32rpx;
        width: 170rpx;
        -webkit-transform: scale(0.8);
        transform: scale(0.8);
      }
      .getIphone{
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 5;
        opacity: 0;
      }
    }
    .xuanze4 {
      z-index: 1;
      border-bottom: 1px solid #E8E8E8;
      .textarea{
        position: relative;
        display: block;
        resize: vertical;
        padding: 10rpx 30rpx;
        line-height: 1.2;
        font-size: 30rpx;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        width: 100%;
        height: 200rpx;
        color: #606266;
        background-color: #fff;
        background-image: none;
        -webkit-transition: border-color .2s cubic-bezier(.645,.045,.355,1);
        transition: border-color .2s cubic-bezier(.645,.045,.355,1);
      }
    }
  }
}

.yy-notice {
  color: #EC9839;
  text-align: center;
  padding: 10px;
  font-size: 13px;
}

.yy-btn {
  background: #FF5723;
  color: #fff;
  border: none;
  display: block;
  width: 40%;
  margin: 20rpx auto;
  font-size: 32rpx;
  border-radius: 12rpx;
  outline: none;
}
</style>