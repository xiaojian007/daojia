<template>
  <div class="joinUs">
    <img mode="widthFix" class="join-img" src="../../../static/img/join.jpg" alt="">
    <form>
      <view class="page-section">
        <view class="weui-cells__title">姓名</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <input class="weui-input" auto-focus placeholder="请输入您的姓名" v-model="submitData.name" />
          </view>
        </view>
        <view class="weui-cells__title">电话</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <input class="weui-input" auto-focus placeholder="请输入您的联系方式" v-model="submitData.tel" />
          </view>
        </view>
        <view class="weui-cells__title">主体</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <i-radio-group class="type" :current="submitData.subject" @change="handleSubjectChange">
                <i-radio v-for="(item, index) in subjectList" :key="index" :value="item.name">
                </i-radio>
            </i-radio-group>
          </view>
        </view>
        <view class="weui-cells__title">主营行业</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <i-checkbox-group :current="submitData.industry" @change="handleIndustryChange">
                <i-checkbox v-for="(item, index) in industryList" :key="index" v-model="item.name">
                </i-checkbox>
            </i-checkbox-group>
          </view>
        </view>
        <view class="weui-cells__title">城市</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <input class="weui-input" auto-focus placeholder="请输入您能服务的城市" v-model="submitData.city" />
          </view>
        </view>
        <view class="weui-cells__title">微信号</view>
        <view class="weui-cells weui-cells_after-title">
          <view class="weui-cell weui-cell_input">
            <input class="weui-input" auto-focus placeholder="请输入您的微信号" v-model="submitData.chat"/>
          </view>
        </view>
      </view>
    </form>
      <button @click="formSubmit">立即加盟</button>
  </div>
</template>

<script>
  import { post, showModal } from '@/util'
  export default {
    data () {
      return {
        // guiguan:[{
        //   id: 0,
        //   title: '水管',
        //   dataList: [{
        //     id: '',
        //     icon: 'fff',
        //     contant: '2324'
        //   },{
        //     id: '',
        //     icon: 'fff',
        //     contant: '2324'
        //   }]
        // },{
        //   id: 1,
        //   title: '统统',
        //   dataList: [{
        //     id: '',
        //     icon: 'fff',
        //     contant: '2324'
        //   },{
        //     id: '',
        //     icon: 'fff',
        //     contant: '2324'
        //   }]
        // }],
        submitData: {
          name: '',
          subject: '个人',
          industry: [],
          tel: '',
          city: '',
          chat: ''
        },
        subjectList: [{
          id: 1,
          name: '企业'
        }, {
          id: 2,
          name: '个体'
        }, {
          id: 3,
          name: '个人'
        }],
        industryList: [{
          id: 1,
          name: '搬家运输'
        }, {
          id: 2,
          name: '管道疏通'
        }, {
          id: 3,
          name: '保洁清洗'
        }, {
          id: 4,
          name: '家电维修'
        }, {
          id: 5,
          name: '保姆月嫂'
        }, {
          id: 6,
          name: '其他服务'
        }]
      }
    },
    components: {
    },
    methods: {
      handleSubjectChange (e) {
        // console.log(e)
        this.submitData.subject = e.mp.detail.value
      },
      handleIndustryChange (e) {
        // console.log(e.mp.detail.value)
        if (this.submitData.industry.indexOf(e.mp.detail.value) === -1) {
          this.submitData.industry.push(e.mp.detail.value)
        }
      },
      async formSubmit () {
        console.log(this.submitData)
        const data = {
          name: this.submitData.name,
          subject: this.submitData.subject,
          industry: this.submitData.industry,
          tel: this.submitData.tel,
          city: this.submitData.city,
          chat: this.submitData.chat
        }
        try {
          await post('/weapp/join', data)
          this.comment = ''
          this.getComments()
        } catch (e) {
          showModal('失败', e.msg)
        }
      },
      formReset () {
        console.log('form发生了reset事件')
      }
    }
  }
</script>

<style lang="scss" scoped>
.joinUs{
    background: #f1f2f6;
    width: 100%;
  .join-img{
    width: 96%;
    display: block;
    margin: 0 auto 20rpx;
  }
  .type{
    display: block;
    width: 100%;
    .i-cell-group{
      display: flex;
      width: 100%;
    }
  }
}
.weui-cells__title {
  margin:10rpx 0;
  padding-left:30rpx;
  padding-right:30rpx;
  color:#999999;
  font-size:14px;
}
.weui-cells {
  margin-top:1.17647059em;
  background-color:#FFFFFF;
  padding: 10rpx 0;
  font-size:24rpx;
}
.weui-cells_after-title {
  margin-top:0;
}
.weui-cell_input {
  padding-top:0;
  padding-bottom:0;
}
.weui-cell {
  padding:0 30rpx;
  position:relative;
  display:-webkit-box;
  display:-webkit-flex;
  display:flex;
  -webkit-box-align:center;
  -webkit-align-items:center;
  align-items:center;
}
.weui-input {
  height:80rpx;
  font-size: 30rpx;
  min-height:80rpx;
  width: 80%;
  line-height:80rpx;
  color: #292d33;
}
.group{
  display: flex;
  display: -webkit-flex;
  width: 100%;
  line-height: 80rpx;
  .items{
    flex: 1;
    .item{
      display: none;
      opacity: 0;
    }
    .label-2__icon {
      position: relative;
      display: inline-block;
      vertical-align: middle;
      margin-right: 10px;
      width: 18px;
      height: 18px;
      background: #fcfff4;
      border-radius: 50px;
      border: 2rpx solid #ccc;
      .label-2__icon-checked {
        position: absolute;
        left: 3px;
        top: 3px;
        width: 12px;
        height: 12px;
        background: #1aad19;
        border-radius: 50%;
      }
    }
    .label-2__text {
      display: inline-block;
      vertical-align: middle;
    }
  }
}



</style>

