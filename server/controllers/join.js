const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const {name, subject, industry, tel, city, chat} = ctx.request.body
    console.log(name, subject, industry, tel, city, chat)
    try {
        await mysql('join').insert({ name, subject, industry, tel, city, chat })
        ctx.state.data = {
            msg: 'success'
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
