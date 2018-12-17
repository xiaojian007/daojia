const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const repairList = await mysql('repairlist')
    const repair = await mysql('repair')
    ctx.state.data = {
        list: repair.map(v => {
            var context = ''
            for (var i = 0; i < repairList.length; i++) {
                if (v.type === repairList[i].type) {
                    context += toJsonString(repairList[i]) + '&'
                }
            }
            // context = context.substring(0, context.lastIndexOf('&'))
            context += ''
            console.log(typeof (context))
            v.context = context.split('&')
            return v
        })
    }
}

function toJsonString (obj) {
    var msg = []
    for (var key in obj) {
        msg.push([key, ':', obj[key]].join(' '))
    }
    return '{' + msg.join(', ') + '}'
}
