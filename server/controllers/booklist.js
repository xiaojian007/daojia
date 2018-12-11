const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const {page, openid} = ctx.request.query
    const size = 10
    const mysqlSelect = mysql('books')
                            .select('books.*', 'csessioninfo.user_info')
                            .join('csessioninfo', 'books.openid', 'csessioninfo.open_id')
                            .orderBy('books.id', 'desc')
    // const books = await mysql('books').select('*')
    let books
    if (openid) {
        // 根据openid判断
        books = await mysqlSelect.where('books.openid', openid)
    } else {
        // 根据page判断
        books = await mysqlSelect.limit(size).offset(Number(page) * size)
    }
    ctx.state.data = {
        list: books
            .map(v => {
                const info = JSON.parse(v.user_info)
                return Object.assign({}, v, {
                    user_info: {
                        nickName: info.nickName
                    }
                })
            })
    }
}