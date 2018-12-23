const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const projectList = await mysql('homecleaning')
    const cleaningList = await mysql('homeproject')
    const swiperList = await mysql('homeswiper')
    const setmealList = await mysql('homesetmeal')
    const homeList = await mysql('home')
    console.log(projectList, cleaningList, swiperList, setmealList, homeList)
    ctx.state.data = {
        list: 'aaaa'
    }
}

// function list (arr1, arr2) {
//     var repairArray = []
//     for (var i = 0; i < arr1.length; i++) {
//         var repairObj = {
//             id: arr1[i].id,
//             name: arr1[i].name
//         }
//         var repairListArray = []
//         for (var j = 0; j < arr2.length; j++) {
//             var repairListObj = {
//                 id: arr2[j].id,
//                 contant: arr2[j].contant,
//                 color: arr2[j].color,
//                 iconfont: arr2[j].iconfont
//             }
//             repairListArray.push(repairListObj)
//         }
//         repairObj.context = repairListArray
//         repairArray.push(repairObj)
//     }
//     return repairArray
// }

// function toJsonString (obj) {
//     var msg = []
//     for (var key in obj) {
//         msg.push([key, ':', obj[key]].join(' '))
//     }
//     return '{' + msg.join(', ') + '}'
// }

