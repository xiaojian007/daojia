<template>
  <div class="yuyue mvpue-picker">
    <h3>预约维修</h3>
    <div class="yuyue-list">

      <div class="xuanze">
        <span class="title">选择类目</span>
        <div class="type" @click="showSinglePicker(0)">{{pickerText}}<span class="typeSpan"></span></div>
      </div>

      <div class="xuanze ">
        <span class="title">选择项目</span>
        <div class="type" @click="showSinglePicker(1)">{{pickerText1}}<span class="typeSpan"></span></div>
      </div>

      <div class="xuanze ">
        <span class="title">预约时间</span>
        <div class="type" @click="showMulLinkageThreePicker">{{pickerText2}}<span class="typeSpan"></span></div>
      </div>

      <div class="xuanze xuanze4">
        <textarea class="textarea" cols="5" placeholder="我要留言......" v-model="textarea">
        </textarea>
      </div>

      <!-- 下拉 -->
      <mpvue-picker ref="mpvuePicker" :mode="mode" :deepLength="deepLength" :pickerValueDefault="pickerValueDefault" :themeColor="themeColor" @onChange="onChange" @onConfirm="onConfirm" @onCancel="onCancel" :pickerValueArray="pickerValueArray"></mpvue-picker>
    </div>
    <p class="yy-notice">*预约成功后客服三十分钟内给您安排并向您回电确认.</p>
    <button class="yy-btn">开始预约</button>
  </div>
</template>

<script>
import mpvuePicker from '@/components/mpvuePicker.vue'
// import mpvuePicker from 'mpvue-picker';
export default {
  components: {
    mpvuePicker
  },
  data () {
    return {
      mode: 'selector',
      deepLength: 0,
      pickerValueDefault: [], // 初始化值
      pickerValueArray: [], // picker 数组值
      pickerText: '请选择',
      pickerText1: '请选择',
      pickerText2: '请选择',
      themeColor: '', // 颜色主题
      textarea: '',
      pickerSingleArray: [
        {
          label: '做饭',
          value: 1
        },
        {
          label: '洗碗',
          value: 2
        },
        {
          label: '保洁',
          value: 3
        }
      ],
      pickerSingleArray2: [
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
      mulLinkageThreePicker: [
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
      ]
    }
  },
  methods: {
    onChange (e) {
      console.log(e)
    },
    onCancel (e) {
      console.log(e)
    },
    // 下拉
    showSinglePicker (item) {
      if (item === 0) {
        this.pickerValueArray = this.pickerSingleArray
      } else if (item === 1) {
        this.pickerValueArray = this.pickerSingleArray2
      }
      this.mode = 'selector'
      this.pickerValueDefault = []
      this.deepLength = item
      this.$refs.mpvuePicker.show()
      this.themeColor = '#247FF6'
    },
    // 时间三级联动选择
    showMulLinkageThreePicker () {
      this.pickerValueArray = this.mulLinkageThreePicker
      this.mode = 'multiLinkageSelector'
      this.deepLength = 3
      this.pickerValueDefault = [1, 1, 1]
      this.themeColor = '#8D0177'
      this.$refs.mpvuePicker.show()
    },
    onConfirm (e) {
      console.log(e.label)
      console.log(this.deepLength)
      if (this.mode === 'selector') {
        if (this.deepLength === 0) {
          this.pickerText = e.label
        } else if (this.deepLength === 1) {
          this.pickerText1 = e.label
        }
      } else if (this.mode === 'multiLinkageSelector' && this.deepLength === 3) {
        this.pickerText2 = e.label
      }
    }
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

      .el-select {
        flex: auto;
      }

      button {
        display: inline-block;
        background: #FF5723;
        color: #fff;
        height: 30px;
        width: 80px;
        border: none;
        padding: 2px;
        // margin-right: 12px;
        border-radius: 5px;
        outline: none;
      }

      .yy-datatime {
        flex: auto;
        padding: 0 15px;
        box-sizing: border-box;

        button {
          width: 100%;
          background: none;
          border: none;
          color: #333;
          box-shadow: none;
          text-align: left;
          outline: none;
        }
      }
    }

    .xuanze4 {
      border-bottom: 1px solid #E8E8E8;
      .textarea{
        display: block;
        resize: vertical;
        padding: 10rpx 30rpx;
        line-height: 1.2;
        font-size: 30rpx;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        width: 100%;
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