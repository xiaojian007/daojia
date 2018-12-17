const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const {id} = ctx.request.query
    const detail = await mysql('books')
                            .select('books.*', 'csessioninfo.user_info')
                            .join('csessioninfo', 'books.openid', 'csessioninfo.open_id')
                            .where('id', id)
                            .first()
    const info = JSON.parse(detail.user_info)
    ctx.state.data = Object.assign({}, detail, {
        tags: detail.tags.split(','),
        summary: detail.summary.split('\n'),
        user_info: {
            name: info.nickName,
            image: info.avatarUrl
        }
    })
    // 点击后增加点击的数目
    await mysql('books')
          .where('id', id)
          .increment('count', 1)
}
