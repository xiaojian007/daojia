const {mysql} = require('../qcloud')

module.exports = async (ctx) => {
    const {bookid, comment, openid, location, phone, times} = ctx.request.body
    console.log(bookid, comment, openid, location, phone, times)
    try {
        await mysql('comments').insert({bookid, comment, openid, location, phone, times})
        ctx.state.data = {
            msg: 'success'
        }
    } catch (e) {
        ctx.state = {
            code: -1,
            data: {
                msg: '评论失败:' + e.sqlMessage
            }
        }
    }
}
