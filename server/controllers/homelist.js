const { mysql } = require('../qcloud')

module.exports = async (ctx) => {
    const projectList = await mysql('homecleaning')
    const cleaningList = await mysql('homeproject')
    const swiperList = await mysql('homeswiper')
    const setmealList = await mysql('homesetmeal')
    const homeList = await mysql('home')
    // console.log(homeList)
    ctx.state.data = {
        list: list(projectList, cleaningList, swiperList, setmealList, homeList)
    }
}

function list (arr1, arr2, arr3, arr4, arr5) {
    var homeArray = {}
    var projectListArray = []
    for (var i = 0; i < arr1.length; i++) {
        var projectListObj = {
            id: arr1[i].id,
            contant: arr1[i].contant,
            color: arr1[i].color,
            iconfont: arr1[i].iconfont
        }
        projectListArray.push(projectListObj)
    }
    var cleaningListArray = []
    for (var j = 0; j < arr2.length; j++) {
        var cleaningListObj = {
            id: arr2[j].id,
            contant: arr2[j].contant,
            color: arr2[j].color,
            iconfont: arr2[j].iconfont
        }
        cleaningListArray.push(cleaningListObj)
    }
    var swiperListArray = []
    for (var k = 0; k < arr3.length; k++) {
        var swiperListObj = {
            id: arr3[k].id,
            url: arr3[k].url,
            img: arr3[k].img
        }
        swiperListArray.push(swiperListObj)
    }
    var setmealListArray = []
    for (var l = 0; l < arr4.length; l++) {
        var setmealListObj = {
            id: arr4[l].id,
            title: arr4[l].title,
            content: arr4[l].content,
            img: arr4[l].img,
            price: arr4[l].price
        }
        setmealListArray.push(setmealListObj)
    }
    homeArray.id = arr5[0].id
    homeArray.name = arr5[0].name
    homeArray.projectList = projectListArray
    homeArray.cleaningList = cleaningListArray
    homeArray.swiperList = swiperListArray
    homeArray.setmealList = setmealListArray
    return homeArray
}

