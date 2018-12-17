// 工具函数库

import config from './config'
//  http get接口调用函数获取数据
export function get (url, data) {
  return request(url, 'GET', data)
}

export function post (url, data) {
  return request(url, 'POST', data)
}

function request (url, method, data) {
  return new Promise((resolve, reject) => {
    wx.request({
      data,
      method,
      url: config.host + url,
      header: {
        'cotent-type': 'application/json'
      },
      success: function (res) {
        // success
        if (res.data.code === 0) {
          resolve(res.data.data)
        } else {
          showModal('失败', res.data.data.msg)
          reject(res.data)
        }
      },
      fail: function () {
        // fail
      },
      complete: function () {
        // complete
      }
    })
  })
}

// 调取成功弹窗
export function showSuccess (text) {
  wx.showToast({
    title: text,
    icon: 'success',
    duration: 2000
  })
}

// 调取成功弹窗
export function showModal (title, content) {
  wx.showModal({
    title,
    content,
    showCancel: false
    // success (res) {
    //   if (res.confirm) {
    //     console.log('用户点击确定')
    //   } else if (res.cancel) {
    //     console.log('用户点击取消')
    //   }
    // }
  })
}

// new date()标准时间转yyyy-mm-dd hh:mm 24小时制
export function newDate (time) {
  const year = time.getFullYear()
  const month = time.getMonth() + 1
  const day = time.getDate()
  const hour = time.getHours()
  const minuter = time.getMinutes()
  const second = time.getSeconds()
  return (year + '-' + month + '-' + day + ' ' + hour + ':' + minuter + ':' + second)
}
