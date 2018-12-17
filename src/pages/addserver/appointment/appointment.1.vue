<template>
  <div class="yuyue">
    <h3>预约维修</h3>
    <div class="yuyue-list">
      <div class="xuanze xuanze1">
        <span>预约时间</span>
        <div class="yy-datatime">
        </div>
      </div>

      <div class="xuanze xuanze2">
        <span>选择类目</span>

      </div>

      <div class="xuanze xuanze2">
        <span>选择项目</span>

      </div>

      <div class="xuanze xuanze4">
        <input type="textarea" :rows="5" placeholder="我要留言" v-model="textarea">
        </input>
      </div>

    </div>
    <p class="yy-notice">*预约成功后客服三十分钟内给您安排并向您回电确认.</p>
    <button class="yy-btn">开始预约</button>
  </div>
</template>

<script>
export default {
  data () {
    return {
      proValue: '',
      textarea: '',
      dateTime: '',
      startDate: new Date()
    }
  }
}
</script>

<style lang="scss">
.baojie {
  &-top {
    width: 100%;
    position: relative;
    text-align: center;

    img {
      max-width: 100%;
    }

    .baojie-free {
      position: absolute;
      width: 100%;
      left: 0;
      bottom: 2%;
      color: #fff;
      font: 200 14px/1 '';

      span {
        display: inline-block;
        color: #F49C23;
        font-weight: 400;
        background: #fff;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        line-height: 24px;
      }
    }
  }
}

// 预约保洁
.yuyue {
  h3 {
    color: #1B85E9;
    text-align: center;
    font: 400 24px/1 '';
    padding: 8% 0 5%;
  }

  .yuyue-list {
    margin: 8px;

    .xuanze {
      display: flex;
      align-items: center;
      line-height: 64px;
      border-top: 1px solid #E8E8E8;
      padding-right: 15px;
      box-sizing: border-box;

      span {
        color: #000;
        font-size: 16px;
        display: inline-block;
        width: 100px;
        text-align: center;
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

    .xuanze3 {
      input.priceValue {
        flex: auto;
        height: 34px;
        line-height: 34px;
        color: #FF5622;
        outline: none;
      }
    }

    .xuanze4 {
      border-bottom: 1px solid #E8E8E8;
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
  margin: 10px auto;
  padding: 8px 30px;
  font-size: 18px;
  border-radius: 6px;
  outline: none;
}
</style>
