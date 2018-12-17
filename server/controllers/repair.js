const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const repair = await mysql('repair')
    const repairList = await mysql('repairlist')
                            // .select('repair.*', 'repairlist.type')
                            // .join('repairlist', 'repair.type', 'repairlist.type')
    // console.log(repair)
    // const repairList = await mysql('repairlist')
    // console.log(repairList)
    ctx.state.data = {
        list: repair.map(v => {
            for (var i = 0; i < repairList.length; i++) {
                if (v.type === repairList[i].type) {
                    // console.log(1)
                    // v.context.push(repairList[i])
                }
            }
            return v
        })
    }
}
