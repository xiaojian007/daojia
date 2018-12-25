/*
SQLyog Enterprise v12.08 (64 bit)
MySQL - 8.0.11 : Database - cauth_bak
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cauth_bak` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;

USE `cauth_bak`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subtime` varchar(50) DEFAULT NULL,
  `drontype` varchar(20) DEFAULT NULL,
  `dronproject` varchar(20) DEFAULT NULL,
  `appointtime` varchar(50) DEFAULT NULL,
  `message` varchar(150) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phonenub` varchar(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `appointment` */

insert  into `appointment`(`id`,`subtime`,`drontype`,`dronproject`,`appointtime`,`message`,`address`,`phonenub`,`name`) values (1,'2018-12-21 14:27:22','保洁','收纳','请选择','','宇宙国地球村中国1号','15655663236',NULL),(2,'2018-12-21 14:28:3','保洁','深度保洁','请选择','','宇宙国地球村中国1号','15655663236',NULL),(3,'2018-12-21 14:37:30','保洁','深度保洁','请选择','','宇宙国地球村中国1号','uu',NULL),(4,'2018-12-21 14:37:55','保洁','日常保洁','2018-12-22 07:00','','宇宙国地球村中国1号','15655663236',NULL),(5,'2018-12-21 14:38:51','洗碗','外墙清洁','2018-12-23 07:00','而我却热情而','北京','15655223654',NULL),(6,'2018-12-21 17:21:13','保洁','深度保洁','2018-12-23 07:00','','宇宙国地球村中国1号','15655663236',NULL),(7,'2018-12-21 18:8:32','做饭','日常保洁','2018-12-21 06:10','','宇宙国地球村中国1号','2','');

/*Table structure for table `books` */

DROP TABLE IF EXISTS `books`;

CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `publisher` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `summary` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `tags` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

/*Data for the table `books` */

insert  into `books`(`id`,`isbn`,`openid`,`title`,`image`,`alt`,`publisher`,`summary`,`price`,`rate`,`tags`,`author`,`count`) values (1,'9787010009230','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','毛泽东选集 第二卷','https://img1.doubanio.com/view/subject/m/public/s23005817.jpg','https://book.douban.com/subject/1125026/','人民出版社','这部选集，包括了毛泽东同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《毛泽东选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。','23.00元',9.1,'毛泽东 357,政治 211,毛泽东选集 210,哲学 159,革命 96,马克思主义 85,历史 84,政经战略 76','毛泽东',6),(2,'9787010009247','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','毛泽东选集 第三卷','https://img1.doubanio.com/view/subject/m/public/s1815767.jpg','https://book.douban.com/subject/1077621/','人民出版社','《毛泽东选集(第3卷)》包括了毛泽东同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《毛泽东选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收进去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著人，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。 \n下面有几点属于出版事务的声明：\n第一，现在出版的这个选集，还是不很完备的。由于国民党反动派对于革命文献的毁灭，由于在长期战争中革命文献的散失，我们现在还不能够找到毛泽东同志的全部著作，特别是毛泽东同志所写的许多书信和电报（这些在毛泽东同志著作中占很大的部分）。\n第二，有些曾经流行的著作，例如《农村调查》，遵照著者的意见，没有编入；又如《经济问题与财政问题》，也遵照著者的意见，只编进了其中的第一章（即《关于过去工作的基本总结》）。\n第三，选集中作了一些注释。其中一部分是属于题解的，附在各篇第一页的下面；其他部分，有属于政治性质的，有属于技术性质的，都附在文章的末尾。\n第四，本选集有两种装订的本子。一种是各时期的著作合订的一卷本，另一种是四卷本。四卷本的第一卷包括第一次国内革命战争时期和第二次国内革命战争时期的著作；第二卷和第三卷包括抗日战争时期的著作；第四卷包括第三次国内革命战争时期的著作。','18.00元',8.9,'毛泽东 303,政治 171,哲学 125,毛泽东选集 114,历史 78,中国 65,革命 63,马克思主义 61','毛泽东',17),(3,'9787115352460','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','Node.js实战','https://img3.doubanio.com/view/subject/m/public/s27264241.jpg','https://book.douban.com/subject/25870705/','人民邮电出版社','服务器端JavaScript？没错。Node.js是一个JavaScript服务器，支持可伸缩的高性能Web应用。借助异步I/O，这个服务器可以同时做很多事情，能满足聊天、游戏和实时统计等应用的需求。并且既然是JavaScript，那你就可以全栈使用一种语言。\n本书向读者展示了如何构建产品级应用，对关键概念的介绍清晰明了，贴近实际的例子，涵盖从安装到部署的各个环节，是一部讲解与实践并重的优秀著作。通过学习本书，读者将深入异步编程、数据存储、输出模板、读写文件系统，掌握创建TCP/IP服务器和命令行工具等非HTTP程序的技术。本书同样非常适合熟悉Rails、Django或PHP开发的读者阅读学习。\n本书主要内容：\nNode.js及其扩展的安装配置；\n全面理解异步编程和事件循环；\n学会开发微博、聊天和游戏等热门应用。','69.00元',8.2,'Node.js 128,JavaScript 67,nodejs 50,web开发 42,node.js 41,前端开发 34,编程 32,node 21','',6),(4,'9787121331565','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','Vue移动开发实战技巧','https://img3.doubanio.com/view/subject/m/public/s29662615.jpg','https://book.douban.com/subject/27662351/','电子工业出版社','内容简介\nVue.js是一个渐进式的JavaScript 框架，与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。Vue 的核心库只关注视图层，它不仅易于上手，还便于与第三方库或既有项目整合。作为2016年社区最火的前端框架，越来越多的公司都在尝试用Vue来开发自己的项目。本书主要以项目维度，站在实战的角度，从项目的搭建，项目开发，到项目的优化，结合实际，多维度介绍了Vue.js。本书从实战场景出发，结合各种实用demo，结合开发环境构建，从无到有，剖析原理，全面介绍Vue2.0的实用技巧。后面几章重点讲解Vue内部实现机制，针对各种业务形态的支持以及网站调优方等等，是Vue技术体系追随者不可多得的实战宝典。','58',0,'Vue 8,前端 6,开发 4,移动 3,软件开发 1,互联网 1,vue.js 1,Vue.js 1','李利德',10),(5,'9787508051000','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','非暴力沟通','https://img1.doubanio.com/view/subject/m/public/s9346487.jpg','https://book.douban.com/subject/3533221/','华夏出版社','作为一个遵纪守法的好人，也许我们从来没有想过和“暴力”扯上关系。不过如果稍微留意一下现实生活中的谈话方式，并且用心体会各种谈话方式给我们的不同感受，我们一定会发现，有些话的确伤人！言语上的职责、嘲讽、否定、说教以及任意打断、拒不回应、随意出口的评价和结论给我们带来的情感和精神上的创伤，甚至比肉体的伤害更加令人痛苦。这些无心或有意的语言暴力让人与人变得冷漠、隔阂、敌视','29.00元',8.5,'心理学 5719,沟通 5170,人际沟通 3846,非暴力沟通 3230,心理 2315,沟通术 1807,人际关系 1607,情感 1525','[美] 马歇尔·卢森堡',11),(6,'9787115275790','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','JavaScript高级程序设计（第3版）','https://img3.doubanio.com/view/subject/m/public/s8958650.jpg','https://book.douban.com/subject/10546125/','人民邮电出版社','本书是JavaScript 超级畅销书的最新版。ECMAScript 5 和HTML5 在标准之争中双双胜出，使大量专有实现和客户端扩展正式进入规范，同时也为JavaScript 增添了很多适应未来发展的新特性。本书这一版除增加5 章全新内容外，其他章节也有较大幅度的增补和修订，新内容篇幅约占三分之一。全书从JavaScript 语言实现的各个组成部分——语言核心、DOM、BOM、事件模型讲起，深入浅出地探讨了面向对象编程、Ajax 与Comet 服务器端通信，HTML5 表单、媒体、Canvas（包括WebGL）及Web Workers、地理定位、跨文档传递消息、客户端存储（包括IndexedDB）等新API，还介绍了离线应用和与维护、性能、部署相关的最佳开发实践。本书附录展望了未来的API 和ECMAScript Harmony 规范。\n本书适合有一定编程经验的Web 应用开发人员阅读，也可作为高校及社会实用技术培训相关专业课程的教材。','99.00元',9.3,'JavaScript 2234,Web前端开发 1022,前端开发 629,前端 480,javascript 478,编程 428,计算机 381,Web开发 380','[美] Nicholas C. Zakas',14),(7,'9787508665849','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','区块链技术驱动金融','https://img1.doubanio.com/view/subject/m/public/s29487148.jpg','https://book.douban.com/subject/26860970/','中信出版社,中信出版集团','从数字货币及智能合约技术层面，解读了区块链技术在金融领域的运用。“如果你正在寻找一本在技术层面解释比特币是如何运作的，并且你有一定计算机科学和编程的基本知识，这本书应该很适合你。”\n《区块链：技术驱动金融》回答了一系列关于比特币如何运用区块链技术运作的问题，并且着重讲述了各种技术功能，以及未来会形成的网络。比特币是如何运作的？它因何而与众不同？你的比特币安全吗？比特币用户如何匿名？区块链如何帮助比特币实现没有身份的共识？我们可以在比特币这一平台上创建什么应用程序？加密数字货币可以被监管吗？创建一种新的数字货币将会带来什么样的变化？未来将会如何发展？\n读完这本书，你会了解到所有比特币和其他数字货币相关的知识，对区块链技术具备基础性认识，能够区别那些完全虚构的故事。你将会对于需要什么样的安全软件，如何与比特币网络进行交互有了基础概念，也可以将区块链的概念整合应用于自己的项目中。你，将会成为时代的引领者！','CNY 79.00',8.4,'区块链 962,金融科技 379,比特币 348,金融 312,互联网 262,计算机 208,技术 180,新经济 156','阿尔文德·纳拉亚南,约什·贝努,爱德华·费尔顿,安德鲁·米勒,史蒂文·戈德费德',13),(8,'9787115282828','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','数学之美','https://img3.doubanio.com/view/subject/m/public/s9114855.jpg','https://book.douban.com/subject/10750155/','人民邮电出版社','几年前，“数学之美”系列文章原刊载于谷歌黑板报，获得上百万次点击，得到读者高度评价。读者说，读了“数学之美”，才发现大学时学的数学知识，比如马尔可夫链、矩阵计算，甚至余弦函数原来都如此亲切，并且栩栩如生，才发现自然语言和信息处理这么有趣。\n今年，作者吴军博士几乎把所有文章都重写了一遍，为的是把高深的数学原理讲得更加通俗易懂，让非专业读者也能领略数学的魅力。读者通过具体的例子学到的是思考问题的方式 —— 如何化繁为简，如何用数学去解决工程问题，如何跳出固有思维不断去思考创新。','45.00元',8.7,'数学 11565,计算机 4872,科普 4007,吴军 3031,计算机科学 2174,互联网 1938,科学 1297,Programming 752','吴军',7),(9,'9787115293800','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','算法（第4版）','https://img3.doubanio.com/view/subject/m/public/s28322244.jpg','https://book.douban.com/subject/19952400/','人民邮电出版社','本书全面讲述算法和数据结构的必备知识，具有以下几大特色。\n     算法领域的经典参考书\nSedgewick畅销著作的最新版，反映了经过几十年演化而成的算法核心知识体系\n 内容全面\n全面论述排序、搜索、图处理和字符串处理的算法和数据结构，涵盖每位程序员应知应会的50种算法\n 全新修订的代码\n全新的Java实现代码，采用模块化的编程风格，所有代码均可供读者使用\n 与实际应用相结合\n在重要的科学、工程和商业应用环境下探讨算法，给出了算法的实际代码，而非同类著作常用的伪代码\n 富于智力趣味性\n简明扼要的内容，用丰富的视觉元素展示的示例，精心设计的代码，详尽的历史和科学背景知识，各种难度的练习，这一切都将使读者手不释卷\n       科学的方法\n用合适的数学模型精确地讨论算法性能，这些模型是在真实环境中得到验证的\n 与网络相结合\n配套网站algs4.cs.princeton.edu提供了本书内容的摘要及相关的代码、测试数据、编程练习、教学课件等资源','99.00元',9.4,'算法 2031,计算机 833,编程 715,计算机科学 420,Algorithms 395,计算机-算法 385,经典 261,Java 251','塞奇威克 (Robert Sedgewick),韦恩 (Kevin Wayne)',5),(10,'9787536693968','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','三体Ⅱ','https://img3.doubanio.com/view/subject/m/public/s3078482.jpg','https://book.douban.com/subject/3066477/','重庆出版社','三体人在利用魔法般的科技锁死了地球人的科学之后，庞大的宇宙舰队杀气腾腾地直扑太阳系，意欲清除地球文明。\n面对前所未有的危局，经历过无数磨难的地球人组建起同样庞大的太空舰队，同时，利用三体人思维透明的致命缺陷，制订了神秘莫测的“面壁计划”，精选出四位“面壁者”。秘密展开对三体人的反击。\n三体人自身虽然无法识破人类的诡谲计谋，却依靠由地球人中的背叛者挑选出的“破壁人”，与“面壁者”展开智慧博弈……\n“面壁计划”究竟能否成功？地球人究竟能否在这场你死我活的文明生存竞争中战而胜之？神秘的\n“黑暗森林”究竟意味着什么？','32.00',9.3,'科幻 24234,刘慈欣 20936,三体 12737,小说 8438,科幻小说 8156,中国 7228,黑暗森林 6530,中国科幻 5377','刘慈欣',4),(11,'9787536692930','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','三体','https://img1.doubanio.com/view/subject/m/public/s2768378.jpg','https://book.douban.com/subject/2567698/','重庆出版社','文化大革命如火如荼进行的同时。军方探寻外星文明的绝秘计划“红岸工程”取得了突破性进展。但在按下发射键的那一刻，历经劫难的叶文洁没有意识到，她彻底改变了人类的命运。地球文明向宇宙发出的第一声啼鸣，以太阳为中心，以光速向宇宙深处飞驰……\n四光年外，“三体文明”正苦苦挣扎——三颗无规则运行的太阳主导下的百余次毁灭与重生逼迫他们逃离母星。而恰在此时。他们接收到了地球发来的信息。在运用超技术锁死地球人的基础科学之后。三体人庞大的宇宙舰队开始向地球进发……\n人类的末日悄然来临。','23.00',8.8,'科幻 50172,刘慈欣 40462,三体 28640,科幻小说 22716,中国 17360,中国科幻 15889,小说 15775,硬科幻 15147','刘慈欣',20),(12,'9787229030933','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','三体Ⅲ','https://img3.doubanio.com/view/subject/m/public/s26012674.jpg','https://book.douban.com/subject/5363767/','重庆出版社','与三体文明的战争使人类第一次看到了宇宙黑暗的真相，地球文明像一个恐惧的孩子，熄灭了寻友的篝火，在暗夜中发抖。自以为历经沧桑，其实刚刚蹒跚学步；自以为悟出了生存竞争的秘密，其实还远没有竞争的资格。\n使两个文明命悬一线的黑暗森林打击，不过是宇宙战场上一个微不足道的插曲。真正的星际战争没人见过，也不可能见到，因为战争的方式和武器已经远远超出人类的想象，目睹战场之日，即是灭亡之时。\n宇宙的田园时代已经远去，昙花一现的终极之美最终变成任何智慧体都无法做出的梦，变成游吟诗人缥缈的残歌；宇宙的物竞天择已到了最惨烈的时刻，在亿万光年暗无天日的战场上，深渊最底层的毁灭力量被唤醒，太空变成了死神广阔的披风。\n太阳系中的人们永远不会知道这一切，最后直面真相的，只有两双眼睛。','38.00元',9.2,'科幻 24992,刘慈欣 22171,三体 14492,小说 8761,中国科幻 8456,科幻小说 7757,中国 6664,硬科幻 6570','刘慈欣',91),(13,'9787010009148','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','毛泽东选集 第一卷','https://img3.doubanio.com/view/subject/m/public/s5804333.jpg','https://book.douban.com/subject/1139360/','人民出版社','《毛泽东选集》(第1卷)包括了毛泽东同志在中国革命各个时期中的重要著作。几年前各地方曾经出过几种不同版本的《毛泽东选集》，都是没有经过著者审查的，体例颇为杂乱，文字亦有错讹，有些重要的著作又没有收过去。现在的这部选集，是按照中国共产党成立后所经历的各个历史时期并且按照著作年月次序而编辑的。这部选集尽可能地搜集了一些为各地方过去印行的集子还没有包括在内的重要著作。选集中的各篇著作，都经著者校阅过，其中有些地方著者曾作了一些文字上的修正，也有个别的文章曾作了一些内容上的补充和修改。\n    下面有几点属于出版事务的声明：\n    第一，现在出版的这个选集，还是不很完备的。由于国民党反动派对于革命文献的毁灭，由于在长期战争中革命文献的散失，我们现在还不能够找到毛泽东同志的全部著作，特别是毛泽东同志所写的许多书信和电报（这些在毛泽东同志著作中占很大的部分）。\n    第二，有些曾经流行的著作，例如《农村调查》，遵照著者的意见，没有编入；又如《经济问题与财政问题》，也遵照著者的意见，只编进了其中的第一章（即《关于过去工作的基本总结》）。\n    第三，选集中作了一些注释。其中一部分是属于题解的，附在各篇第一页的下面；其他部分，有属于政治性质的，有属于技术性质的，都附在文章的末尾。\n    第四，本选集有两种装订的本子。一种是各时期的著作合订的一卷本，另一种是四卷本。四卷本的第一卷包括第一次国内革命战争时期和第二次国内革命战争时期的著作；第二卷和第三卷包括抗日战争时期的著作；第四卷包括第三次国内革命战争时期的著作。','40.00元',9.1,'毛泽东 1625,毛泽东选集 1320,哲学 1011,政治 931,经典 656,毛选 606,革命 514,中国 493','毛泽东',85),(14,'9787115351531','oDgoW0Z0qq1KtwAcjrgog_oBsdf4','图解HTTP','https://img3.doubanio.com/view/subject/m/public/s27283822.jpg','https://book.douban.com/subject/25863515/','人民邮电出版社','本书对互联网基盘——HTTP协议进行了全面系统的介绍。作者由HTTP协议的发展历史娓娓道来，严谨细致地剖析了HTTP协议的结构，列举诸多常见通信场景及实战案例，最后延伸到Web安全、最新技术动向等方面。本书的特色为在讲解的同时，辅以大量生动形象的通信图例，更好地帮助读者深刻理解HTTP通信过程中客户端与服务器之间的交互情况。读者可通过本书快速了解并掌握HTTP协议的基础，前端工程师分析抓包数据，后端工程师实现REST API、实现自己的HTTP服务器等过程中所需的HTTP相关知识点本书均有介绍。\n本书适合Web开发工程师，以及对HTTP协议感兴趣的各层次读者。','49.00元',8.1,'HTTP 1195,网络 566,计算机 510,协议 348,互联网 310,Web 211,web 203,网络编程 175','【日】上野宣',0);

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) NOT NULL,
  `bookid` varchar(100) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `times` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `comments` */

insert  into `comments`(`id`,`openid`,`bookid`,`comment`,`phone`,`location`,`times`) values (6,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','3','共和国的特w为232','iPhone 6','上海市',''),(7,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','我去恶趣味','iPhone 6','上海市',''),(8,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','','',''),(9,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','iPhone 6','上海市',''),(10,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','13','请问驱蚊器','iPhone 6','上海市',''),(11,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','iPhone 6','上海市',''),(12,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','13','我和你信息行行行斯洛伐克联合反恐位人位人为认为其二','iPhone 6','上海市',''),(13,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','二二五位人为位人','iPhone 6','上海市',''),(14,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','认为瑞文肉','iPhone 6','上海市',''),(15,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','13','趣味请问','iPhone 6','上海市',''),(16,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','13','企鹅切维奇','iPhone 6','上海市','2018-11-16 16:02:04'),(17,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','如题如题温柔i我今儿哦','iPhone 6','上海市','2018-11-16 16:04:57'),(18,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','iPhone 6','上海市','2018-11-16 16:10:24'),(19,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','iPhone 6','上海市','2018-11-16 16:10:29'),(20,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','趣味请问','iPhone 6','上海市','2018-11-16 16:10:31'),(21,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','11','趣味请问','iPhone 6','上海市','2018-11-16 16:12:58'),(22,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','12','委屈','iPhone 6','上海市','2018-11-16 16:15:20'),(23,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','2','去恶趣味请问','iPhone 6','上海市','2018-11-16 17:46:57'),(24,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','4','趣味请问','iPhone 6','上海市','2018-11-19 13:57:14'),(25,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','7','小激动鸡肉卷放假','16 X','上海市','2018-11-20 16:31:12'),(26,'oDgoW0Z0qq1KtwAcjrgog_oBsdf4','10','都觉得加班费放假','16 X','','2018-11-20 16:36:36');

/*Table structure for table `csessioninfo` */

DROP TABLE IF EXISTS `csessioninfo`;

CREATE TABLE `csessioninfo` (
  `open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `skey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_visit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `session_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_info` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`open_id`),
  KEY `openid` (`open_id`) USING BTREE,
  KEY `skey` (`skey`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='会话管理用户信息';

/*Data for the table `csessioninfo` */

insert  into `csessioninfo`(`open_id`,`uuid`,`skey`,`create_time`,`last_visit_time`,`session_key`,`user_info`) values ('oDgoW0Z0qq1KtwAcjrgog_oBsdf4','65a0c5de-83c5-484f-8d7c-88b2db64a6e8','82b9def4995724d79b5224add4a3f3f1b414b5f7','2018-11-12 23:32:51','2018-12-20 13:51:26','yUU/yMo6oOgB/3oPs2+4PA==','{\"openId\":\"oDgoW0Z0qq1KtwAcjrgog_oBsdf4\",\"nickName\":\"@小贱\",\"gender\":1,\"language\":\"zh_CN\",\"city\":\"\",\"province\":\"Shanghai\",\"country\":\"China\",\"avatarUrl\":\"https://wx.qlogo.cn/mmopen/vi_32/0YNrEgUxRZA5iaqEjczKMxPjfxBNrYQ9zlKuic25uInBuPamxfqBibrnHOstRUzUnKpf05HukOQmRUV4AztbUKrWQ/132\",\"watermark\":{\"timestamp\":1545285058,\"appid\":\"wxdf81a9bc7204e308\"}}');

/*Table structure for table `home` */

DROP TABLE IF EXISTS `home`;

CREATE TABLE `home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `projectList` longtext,
  `cleaningList` longtext,
  `swiperList` longtext,
  `setmealList` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `home` */

insert  into `home`(`id`,`name`,`projectList`,`cleaningList`,`swiperList`,`setmealList`) values (1,'小贱',NULL,NULL,NULL,NULL);

/*Table structure for table `homecleaning` */

DROP TABLE IF EXISTS `homecleaning`;

CREATE TABLE `homecleaning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconfont` varchar(50) DEFAULT NULL,
  `contant` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `homecleaning` */

insert  into `homecleaning`(`id`,`iconfont`,`contant`,`color`) values (1,'icon-richangweisheng','日常保洁','iconColor4'),(2,'icon-jujiakaihuangbaojie','深度保洁','iconColor4'),(3,'icon-boliqingjie','开荒保洁','iconColor4'),(4,'icon-baomu','保姆月嫂','iconColor4'),(5,'icon-shouna','收纳','iconColor4'),(6,'icon-fangshuizhilou','外墙清洁',NULL);

/*Table structure for table `homeproject` */

DROP TABLE IF EXISTS `homeproject`;

CREATE TABLE `homeproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconfont` varchar(50) DEFAULT NULL,
  `contant` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `homeproject` */

insert  into `homeproject`(`id`,`iconfont`,`contant`,`color`) values (1,'icon-zuofanxiwan','做饭','iconColor2'),(2,'icon-zuofanxiwan','洗碗','iconColor1'),(3,'icon-richangweisheng','保洁','iconColor5');

/*Table structure for table `homesetmeal` */

DROP TABLE IF EXISTS `homesetmeal`;

CREATE TABLE `homesetmeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `homesetmeal` */

insert  into `homesetmeal`(`id`,`title`,`img`,`content`,`price`) values (1,'日常保洁','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时精细擦窗','58'),(2,'擦玻璃','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时厨房蒸洗','70'),(3,'做饭','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时保洁+4小时擦窗+4小时厨房蒸洗','90'),(4,'油烟机清洗','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时厨房蒸洗','50'),(5,'空调清洗','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时精细擦窗','40'),(6,'冰箱清洗','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时保洁+4小时擦窗+4小时厨房蒸洗','100'),(7,'沙发保养','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时厨房蒸洗','580'),(8,'地板打蜡','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时精细擦窗','620'),(9,'新居开荒','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时厨房蒸洗','150'),(10,'家居经典套餐','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时精细擦窗','43'),(11,'全面大扫除套餐','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时保洁+4小时擦窗+4小时厨房蒸洗','25'),(12,'厨房保洁清蒸','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时全屋保洁+4小时厨房蒸洗','30'),(13,'全面大扫除套餐','http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/img.png','4小时保洁+4小时擦窗+4小时厨房蒸洗','100');

/*Table structure for table `homeswiper` */

DROP TABLE IF EXISTS `homeswiper`;

CREATE TABLE `homeswiper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(20) DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `homeswiper` */

insert  into `homeswiper`(`id`,`url`,`img`) values (1,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png'),(2,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png'),(3,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png'),(4,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png'),(5,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png'),(6,NULL,'http://www.bitauto.com/topics/ad_topic/xtlcx/miniImg/banner.png');

/*Table structure for table `join` */

DROP TABLE IF EXISTS `join`;

CREATE TABLE `join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(11) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `industry` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `join` */

insert  into `join`(`id`,`subject`,`city`,`chat`,`name`,`tel`,`industry`) values (1,'个体','123123','123123123','123123','123123','231321'),(2,'个体','123123','123123123','123123','123123','231321'),(3,'个体','123123','123123123','123123','123123','231321'),(4,'个体','123123','123123123','123123','123123','231321'),(5,'个体','123123','123123123','123123','123123','231321'),(6,'个体','123123','123123123','123123','123123','231321'),(7,'个体','123123','123123123','123123','123123','231321'),(8,'个体','123123','123123123','123123','123123','231321'),(9,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(10,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(11,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(12,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(13,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(14,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(15,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(16,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(17,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(18,'个体','趣味请问','请问去我','趣味请问','我去恶趣味','[object Undefined]'),(19,'企业','请问','强强饿','请问','请问','[object Undefined]'),(20,'个体','去欸','去欸','企鹅请问','请问 ','管道疏通,保姆月嫂,其他服务'),(21,'个体','请问','请问','趣味请问','q请问','管道疏通,保姆月嫂,保洁清洗,其他服务'),(22,'个体','去而且','趣味请问','趣味请问','问去问 ','保姆月嫂,管道疏通'),(23,'个体','嗯亲吻','请问','请问去','趣味请问','管道疏通,保姆月嫂'),(24,'个体','嗯亲吻','请问','请问去','趣味请问','管道疏通,保姆月嫂'),(25,'个体','嗯亲吻','请问','请问去','趣味请问','管道疏通,保姆月嫂'),(26,'个体','嗯亲吻','请问','请问去','趣味请问','管道疏通,保姆月嫂'),(27,'个体','嗯亲吻','请问','请问去','趣味请问','管道疏通,保姆月嫂'),(28,'个人','','','','',''),(29,'个人','请问','请问','请问','问去问',''),(30,'个人','请问','请问','请问','问去问','保洁清洗,其他服务'),(31,'个人','','','','',''),(32,'个人','','','','','管道疏通,保洁清洗'),(33,'个人','去而且','请问','趣味请问','趣味请问','保姆月嫂,保洁清洗,其他服务'),(34,'个人','请问',' 请问去','趣味请问','去问我去饿','保姆月嫂'),(35,'个人','请问',' 请问去','趣味请问','去问我去饿','保姆月嫂'),(36,'个人','','','为','请问','保姆月嫂'),(37,'个体','请问','请问','q趣味请问','请问','管道疏通,保姆月嫂,其他服务'),(38,'个人','','','趣味请问','请问',''),(39,'个人','','','','',''),(40,'个人','','','请问','','');

/*Table structure for table `repair` */

DROP TABLE IF EXISTS `repair`;

CREATE TABLE `repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `context` longtext,
  `type` int(11) DEFAULT NULL,
  `others2` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `repair` */

insert  into `repair`(`id`,`name`,`context`,`type`,`others2`) values (1,'水电疏通',NULL,0,NULL),(2,'开锁换锁',NULL,1,NULL),(3,'家电维修',NULL,2,NULL);

/*Table structure for table `repairlist` */

DROP TABLE IF EXISTS `repairlist`;

CREATE TABLE `repairlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconfont` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contant` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `color` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `repairlist` */

insert  into `repairlist`(`id`,`iconfont`,`contant`,`color`,`type`) values (1,'icon-guandaoshutong','管道疏通','iconColor1',0),(2,'icon-shuiguanlongtou','水管龙头','iconColor2',0),(3,'icon-dengjudianlu','灯具电路','iconColor3',0),(4,'icon-fangshuizhilou','防水治漏','iconColor4',0),(5,'icon-weishengjianshenduqingjie','厨卫洁具','iconColor5',0),(6,'icon-genghuansuoxin','更换锁芯','iconColor2',1),(7,'icon-genghuanzhengtisuo','更换整套锁','iconColor3',1),(8,'icon-genghuanmenbashou','更换门把手','iconColor4',1),(9,'icon-genghuansuoti','更换锁体','iconColor5',1),(10,'icon-genghuanzhiwensuo','更换指纹锁','iconColor6',1),(11,'icon-baoxianxiangkaisuo','保险箱开锁','iconColor7',1),(12,'icon-qichekaisuo','汽车开锁','iconColor8',1),(13,'icon-kongtiaojiafu','空调加氟','iconColor1',2),(14,'icon-kongtiaoyiji','空调移机安装','iconColor2',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
