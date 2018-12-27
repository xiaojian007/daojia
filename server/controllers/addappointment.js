const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const {name, subtime, dronproject, appointtime, message, address, phonenub} = ctx.request.body
    try {
        await mysql('appointment').insert({ name, subtime, dronproject, appointtime, message, address, phonenub })
        ctx.state.data = {
            msg: '预约成功'
        }
    } catch (e) {
        ctx.state = {
            code: -1,
            data: {
                msg: '提交失败' + e.sqlMessage
            }
        }
        console.log(e)
    }
}
