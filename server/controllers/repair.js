const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const repairList = await mysql('repairlist')
    const repair = await mysql('repair')
    ctx.state.data = {
        list: list(repair, repairList)
    }
}

function list (arr1, arr2) {
    var repairArray = new Array()
    for (var i = 0; i < arr1.length; i++) {
        var aa = {
            id: arr1[i].id,
            name: arr1[i].name
        }
        var repairListArray = new Array()
        for (var j = 0; j < arr2.length; j++) {
            var repairListObj = {
                id: arr2[j].id,
                contant: arr2[j].contant,
                color: arr2[j].color,
                iconfont: arr2[j].iconfont
            }
            repairListArray.push(repairListObj)
        }
        aa.context = repairListArray
        repairArray.push(aa)
    }
    return repairArray
}

// function toJsonString (obj) {
//     var msg = []
//     for (var key in obj) {
//         msg.push([key, ':', obj[key]].join(' '))
//     }
//     return '{' + msg.join(', ') + '}'
// }
