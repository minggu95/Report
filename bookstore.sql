/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50557
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MySQL
 Target Server Version : 50557
 File Encoding         : 65001

 Date: 02/06/2020 16:19:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `n_time` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`n_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (3, '特价', '书城特别好，特价', '13:23:37');
INSERT INTO `notice` VALUES (4, '不行', '你好啊！123', '13:23:44');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem`  (
  `order_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `buynum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('27e0ce9b-484e-4843-b7af-c51fc537b53a', 'ada25630de72485ba58a316031443a8c', 4);
INSERT INTO `orderitem` VALUES ('27e0ce9b-484e-4843-b7af-c51fc537b53a', 'b1', 5);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `money` double NULL DEFAULT NULL,
  `receiverAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverPhone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `paystate` int(11) NULL DEFAULT 0,
  `ordertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('27e0ce9b-484e-4843-b7af-c51fc537b53a', 598.9, '', '李国明', '', 0, '2016-01-21 13:20:40', 2);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `category` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pnum` int(11) NULL DEFAULT NULL,
  `imgurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('5652c363f7d44ca5aac42d861697faec', 'Node.js入门经典', 48, '计算机', 6, '/bookcover/d4.png', 'Node.js入门经典高级技术');
INSERT INTO `products` VALUES ('a0c8967477dc43f7a489405701748805', '疯狂java讲义', 69.5, '计算机', 6, '/bookcover/TS2.png', '《疯狂Java讲义(第3版)》内容简介：《疯狂Java讲义(第3版)》是《疯狂Java讲义》的第3版，第3版保持了前两版系统、全面、讲解浅显、细致的特性，全面新增介绍了Java 8的新特性，《疯狂Java讲义(第3版)》大部分示例程序都采用Lambda表达式、流式API进行了改写，因此务必使用Java 8的JDK来编译、运行。');
INSERT INTO `products` VALUES ('ada25630de72485ba58a316031443a8c', 'JavaScript忍者秘籍', 61.6, '计算机', 2, '/bookcover/d5.png', '锋利的JS高手精通修炼实战手册 jQuery之父John Resig经典力作');
INSERT INTO `products` VALUES ('b1', 'Java编程思想（第4版）', 70.5, '计算机', 1, '/bookcover/TS4.png', '《Java编程思想(第4版)》书共22章，包括操作符、控制执行流程、访问权限控制、复用类、多态、接口、通过异常处理错误、字符串、泛型、数组、容器深入研究、Iava’UO系统、枚举类型、并发以及图形化用户界面等内容。这些丰富的内容，包含了Java语言...');
INSERT INTO `products` VALUES ('b11', 'Java基础入门', 37.8, '计算机', 6, '/bookcover/TS13.png', '附有配套视频、源代码、测试题、教学PPT、教学实施案例、教学设计大纲等资源，并提供在线答疑平台。');
INSERT INTO `products` VALUES ('b12', 'Java Web程序开发进阶', 34.8, '计算机', 6, '/bookcover/d6.png', '传智播客高教产品研发部编著的《JavaWeb程序开发进阶》从有一定Web开发基础的编程人员的角度出发，深刻地揭示了JavaWeb开发的内幕');
INSERT INTO `products` VALUES ('b13', 'Android 移动应用基础教程', 35.5, '计算机', 6, '/bookcover/d7.png', '传智播客');
INSERT INTO `products` VALUES ('b14', 'PHP网站开发实例教程', 40.1, '计算机', 6, '/bookcover/d8.png', '黎活明，传智播客成立于2006年，它是由中国Java培训第一人张孝祥老师发起，联合全球最大的中文IT社区CSDN、中关村软件园共同创办的一家专业教育机构。');
INSERT INTO `products` VALUES ('b2', 'Hadoop权威指南', 74.5, '计算机', 6, '/bookcover/TS5.png', '全面深度解读Hadoop的指南，驰骋于云计算和大数据领域的通俗读本');
INSERT INTO `products` VALUES ('b3', 'Python核心编程', 68.4, '计算机', 6, '/bookcover/TS6.png', 'Python领域经典的开发指南，不可错过的编程实践宝典！');
INSERT INTO `products` VALUES ('b4', 'PHP从入门到精通', 57.8, '计算机', 6, '/bookcover/TS7.png', '这种类似从入门到精通就不要买了');
INSERT INTO `products` VALUES ('b5', 'Ruby元编程', 55, '计算机', 6, '/bookcover/TS8.png', 'Ruby之父松本行弘作序推荐');
INSERT INTO `products` VALUES ('b6', '深入理解Java虚拟机：JVM高级特性与最佳实践', 58, '计算机', 6, '/bookcover/TS9.png', '基于最新JDK1.7，围绕内存管理、执行子系统、程序编译与优化、高效并发等核心主题对JVM进行全面而深入的分析，深刻揭示JVM的工作原理');
INSERT INTO `products` VALUES ('b7', '软件架构设计：程序员向架构师转型必备', 32.7, '计算机', 6, '/bookcover/TS.png', '详解软件架构设计实践过程及方法，成为软件架构设计师必读书');
INSERT INTO `products` VALUES ('b8', '第一行代码 Android', 55.7, '计算机', 6, '/bookcover/TS11.png', 'CSDN超人气博主、CSDN 2013年度十大博客之星、Android开发者郭霖力作！本引入经验值、升级与宝物系统的计算机书！见证自己从菜鸟到鹰的成长！');
INSERT INTO `products` VALUES ('b9', 'Android 4高级编程', 83.3, '计算机', 6, '/bookcover/TS12.png', 'Android专家编写，使用Android 4 SDK开发移动应用程序的理想指南，经典图书升级版本！');
INSERT INTO `products` VALUES ('c1', '感悟', 36, '文学', 6, '/bookcover/102.jpg', 'lalala');
INSERT INTO `products` VALUES ('c10', '文明之光(第1-3册)', 118.7, '文学', 6, '/bookcover/d1.png', '《文明之光》吴军博士从对人类文明产生了重大影响却在过去被忽略的历史故事里，选择了有意思的几十个片段特写，以人文和科技、经济结合的视角，有机地展现了一幅人类文明发展的宏大画卷。《文明之光》系列大致按照从地球诞生到近现代的顺序讲述了人类文明进程的各个阶段，每个章节相对独立，全景式地展现了人类文明发展历程中的多样性。《文明之光》系列第一册讲述从人类文明开始到近代大航海这一历史阶段，共八个专题。第二册讲述了从近代科学...');
INSERT INTO `products` VALUES ('c12', '金瓶梅(套装上下册)', 120, '文学', 6, '/bookcover/c7.png', '《金瓶梅(套装上下册)》内容简介：《金瓶梅》产生在明代嘉靖。万历年间，与《三国演义》，《水浒传》，《西游记》合称四大奇书。小说借《水浒传》中武松杀嫂故事作引子，展开故事情节，表面是宋代的故事，实际上写明代的生活。小说开拓了新的题材，拓展了审美领域，塑造了西门庆、潘金莲、李瓶儿、春梅、应伯爵，陈敬济等典型形象。小说以市井人物为主要角色，能多侧面多层次地描写，将明代封建社会的黑暗腐朽暴露得淋漓尽致。');
INSERT INTO `products` VALUES ('c13', '无声告白', 21.4, '生活', 6, '/bookcover/c1.png', '《无声告白》内容简介：莉迪亚死了，可他们还不知道。 莉迪亚是家中老二，李先生和李太太的掌上明珠，她遗传了母亲的蓝眼睛和父亲的黑头发。父母深信，莉迪亚一定能实现他们无法实现的梦想。莉迪亚的尸体被发现后，她的父亲内疚不已，母亲则一心报复。莉迪亚的哥哥觉得，隔壁的坏小子铁定脱不了关系，只有莉迪亚的妹妹看得一清二楚，而且，很可能只有她知道真相的人……');
INSERT INTO `products` VALUES ('c14', '这么慢,那么美', 22.6, '生活', 6, '/bookcover/c2.png', '幸福永远得来不易！ 许多人将全球幸福指数归结于北欧制度、福利、资源等因素，但真的仅仅是这样吗？ 幸福是什么？物质很重要，但仅仅是“够用”就可以了。北欧人的幸福感，更多来源于简约、自然、宁静的......');
INSERT INTO `products` VALUES ('c2', '赢在影响力', 29.9, '励志', 6, '/bookcover/TS112.png', 'lalala');
INSERT INTO `products` VALUES ('c3', '谁动了我的奶酪？', 26, '励志', 6, '/bookcover/TS3.png', 'hahaha');
INSERT INTO `products` VALUES ('c4', '魔法树的故事', 33.8, '少儿', 11, '/bookcover/c8.png', '《魔法树的故事(套装共3册)》内容简介：分别是《魔法树》、《魔法树顶的国度》、《魔法树上的居民》。是伊妮德•布莱顿的代表作品，自1939年问世以来，一直深受各个年龄段、不同国家的读者喜爱。从上个世纪到这个世纪，魔法树获得了无数的殊荣：入选英国BBC评选的“100部英国人很喜欢的文学作品”大榜单，入选英国《卫报》评选的“生命中不可缺少的100本书”，是200位英国图书馆馆长推荐必读童书。');
INSERT INTO `products` VALUES ('c5', '白岩松:白说', 27.2, '社科', 6, '/bookcover/c3.png', '《白说》是央视资深新闻人白岩松继《幸福了吗》《痛并快乐着》之后的全新作品，一部“自传”式的心灵履历。通过近年来于各个场合与公众的深入交流，以平等自由的态度，分享其世界观和价值观。时间跨度长达十五年，涵盖时政、教育、改革、音乐、阅读、人生等多个领域，温暖发声，理性执言。在有权保持沉默的年纪拒绝沉默，为依然热血有梦的人们敲鼓拨弦。尽管“说话不是件好玩的事儿”，依然向往“说出一个更好点儿的未来”，就算“说了白说”，可是“不说，白不说”。');
INSERT INTO `products` VALUES ('c6', '不要让未来的你,讨厌现在的自己', 19.7, '励志', 6, '/bookcover/c4.png', '《不要让未来的你,讨厌现在的自己》是豆瓣红人特立独行的猫写给千万年轻人的人生成长之书。著名人生规划师、畅销书《拆掉思维里的墙》作者古典亲笔作序，豆瓣红人Meiya、考拉小巫温暖推荐。独家收录豆瓣超级热帖《留在大城市，还是回老家？》、《不要让未来的你,讨厌现在的自己》、《躲过的，总有一天会找回来》……66篇佳作，9000000次网站转载，超2亿次阅读，激励无数人！');
INSERT INTO `products` VALUES ('c7', '数学之书', 58.1, '学术', 6, '/bookcover/c5.png', '《数学之书》内容简介：人类什么时候在绳子上打下第一个结？为什么第一位女数学家会死于非命？有可能把一个球体的内部翻转出来吗？');
INSERT INTO `products` VALUES ('c8', '高效能人士的七个习惯(25周年纪念版)', 34, '励志', 6, '/bookcover/c6.png', '《高效能人士的七个习惯(25周年纪念版)》是一部永恒的畅销书，里程碑式的著作——高居《纽约时报》最畅销书排行榜之首长达20多年，总销量超过2500万册，在全球140个国家以40种语言出版。《高效能人士的七个习惯(25周年纪念版)》常年稳居中国各大新华书店、亚马逊最畅销排行榜前10名，畅销25年，影响力覆盖几亿人。一代“思想巨匠”的经典巨著全新升级版。塑造高效能的个人和组织。双色，大16开，装帧精美。');
INSERT INTO `products` VALUES ('c9', '数学之美(第二版)', 32.9, '学术', 6, '/bookcover/c9.png', '几年前，“数学之美”系列文章原刊载于谷歌黑板报，获得上百万次点击，得到读者高度评价。 正式出版前，吴军博士几乎把所有文章都重写了一遍，为的是把高深的数学原理讲得更加通俗易懂，让非专业读者也能领略数学的魅力。');
INSERT INTO `products` VALUES ('d1', '浪潮之巅(第2版)', 56, '文学', 6, '/bookcover/d2.png', '《浪潮之巅(第2版)(套装上下册)》不是一本科技产业发展历史集，而是在这个数字时代，一本IT人非读不可，而非IT人也应该阅读的作品。一个企业的发展与崛起，绝非只是空有领导强人即可达成。任何的决策、同期的商业环境，都在都影响着企业...');
INSERT INTO `products` VALUES ('d10', '互联网+智能家居', 36.8, '科技', 6, '/bookcover/e8.png', '《互联网+智能家居》从智能家居的概念出发，系统地分析了整个行业的起源与发展态势、当下存在的各种问题、全新的商业模式思考、技术支持等。');
INSERT INTO `products` VALUES ('d11', '机器人', 54.5, '科技', 6, '/bookcover/e9.png', '未来社会...');
INSERT INTO `products` VALUES ('d12', '我们改变了互联网，还是互联网改变了我们？Web4.0', 21.8, '科技', 6, '/bookcover/e.png', '一本预示着Web4.0网络大时代来临的开创性读物');
INSERT INTO `products` VALUES ('d2', 'Java 就业培训教程', 33.2, '计算机', 6, '/bookcover/d3.png', '《Java 就业培训教程》全书共分11章。第1章详细地讲解了Java开发环境的搭建、反编译工具的使用、JDK文档资料的查阅以及Java程序的编译和运行过程。第2章系统地讲解了Java的一些常用语法，在讲解语法的过程中，作者把常见问题进行了正反对比...');
INSERT INTO `products` VALUES ('d3', '富爸爸穷爸爸', 17.1, '经管', 6, '/bookcover/e1.png', '央视《对话》15周年庆典，《富爸爸穷爸爸》入选大家共同关注的五本书之一，此书由汤小明先生策划出版发行，是改变千万人投资理财理念的财富“圣经”');
INSERT INTO `products` VALUES ('d4', '工作前5年，决定你一生的财富', 29.2, '经管', 6, '/bookcover/e2.png', '豆瓣读书、随手记社区、赞赏公众号、挖财社区、水湄物语联合推荐');
INSERT INTO `products` VALUES ('d5', '股票大作手回忆录', 28.8, '经管', 6, '/bookcover/e3.png', '刘强遗作推荐中国金融翻译界元勋丁圣元殚精竭虑之力作。');
INSERT INTO `products` VALUES ('d6', '巴菲特之道', 44.9, '经管', 6, '/bookcover/e4.png', '将巴菲特思想引进中国的一本书，认真研读本书的价值不亚于巴菲特的午餐！彼得·林奇、肯尼斯·费雪等投资大家作序真诚推荐，金石资产CEO杨天南倾力译作');
INSERT INTO `products` VALUES ('d7', '红楼梦（上、下册）', 41.7, '文学', 6, '/bookcover/e5.png', '权威版本！收藏经典！');
INSERT INTO `products` VALUES ('d8', '大话物联网', 36.7, '科技', 6, '/bookcover/e6.png', '物联网导论技术不可错过的经典图书！');
INSERT INTO `products` VALUES ('d9', '智能家居——下一场巨头的游戏', 43.5, '科技', 6, '/bookcover/e7.png', '本书是一本智能家居商业模式介绍和品牌竞争格局分析的读物！');
INSERT INTO `products` VALUES ('f', 'Maven实战', 32.8, '计算机', 6, '/bookcover/f.png', '项目管理开发');
INSERT INTO `products` VALUES ('f1', 'Java邮件开发详解', 29.5, '计算机', 6, '/bookcover/f1.png', '传智播客创始人张孝祥和方立勋老师');
INSERT INTO `products` VALUES ('f2', 'EJB3.0入门经典', 33.8, '计算机', 6, '/bookcover/f2.png', '传智播客创始人黎活明老师');
INSERT INTO `products` VALUES ('f3', '深入体验Java Web开发内幕', 40.5, '计算机', 6, '/bookcover/f3.png', '传智播客创始人张孝祥和方立勋老师');
INSERT INTO `products` VALUES ('f4', 'JavaScript网页开发', 21.8, '计算机', 6, '/bookcover/f4.png', '传智播客创始人张孝祥老师');
INSERT INTO `products` VALUES ('f5', '失控：全人类的最终命运和结局', 51.8, '科技', 6, '/bookcover/f5.png', '极具智慧和价值的一本书、《长尾理论》作者强力推荐');
INSERT INTO `products` VALUES ('f6', 'SSH-Java Web开发', 39.5, '计算机', 6, '/bookcover/f6.png', 'struts+spring+hibernate');
INSERT INTO `products` VALUES ('f7', 'NoSQL数据库技术', 38.8, '计算机', 6, '/bookcover/f7.png', 'mongoDB,redis');
INSERT INTO `products` VALUES ('f8', 'Linux基础学习', 48.1, '计算机', 6, '/bookcover/f8.png', '经典linux学习技术');
INSERT INTO `products` VALUES ('f9', 'Oracle编程艺术', 60, '计算机', 6, '/bookcover/f9.png', '9i,10g,11g');
INSERT INTO `products` VALUES ('g', '疯狂Ajax讲义', 36.8, '计算机', 6, '/bookcover/g.png', '异步交互技术');
INSERT INTO `products` VALUES ('g1', 'lucene实战', 40.1, '计算机', 6, '/bookcover/g1.png', '搜索技术');
INSERT INTO `products` VALUES ('g2', 'Mabatis框架', 41.8, '计算机', 6, '/bookcover/g2.png', '只有英文书籍，传智在讲');
INSERT INTO `products` VALUES ('g3', 'Spring Mvc指南', 37.8, '计算机', 6, '/bookcover/g3.png', '前端框架，如struts');
INSERT INTO `products` VALUES ('g4', 'Java RESTful Web Service实战', 56.1, '计算机', 6, '/bookcover/g4.png', '借口开发，总线系统');
INSERT INTO `products` VALUES ('g5', '疯狂Workflow讲义', 56.1, '计算机', 6, '/bookcover/g5.png', 'activiti工作流技术');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `introduce` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `activeCode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT 1,
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '普通用户',
  `registTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (4, 'lisi', 'D25D76DA2AF69188F80EBB1BF4D17819FEFCD2D6499D8374DB0F4B3F', '男', 'lisi@qq.com', '12345678987', 'sda', '7b3434e5-22a2-4b62-b8c9-01ac2766a9be', 1, '超级用户', '2020-05-25 13:31:55');
INSERT INTO `user` VALUES (9, 'L@g111', 'D25D76DA2AF69188F80EBB1BF4D17819FEFCD2D6499D8374DB0F4B3F', '男', '3519215611@qq.com', '13162576583', '', '6a59023a-cc99-4201-973e-ac656558f171', 1, '普通用户', '2020-05-25 13:29:43');

SET FOREIGN_KEY_CHECKS = 1;
