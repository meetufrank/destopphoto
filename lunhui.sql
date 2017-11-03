/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : lunhui

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-11-03 14:25:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_ad
-- ----------------------------
DROP TABLE IF EXISTS `think_ad`;
CREATE TABLE `think_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `ad_position_id` varchar(10) DEFAULT NULL COMMENT '广告位',
  `link_url` varchar(128) DEFAULT NULL,
  `images` varchar(128) DEFAULT NULL,
  `start_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  `closed` tinyint(1) DEFAULT '0',
  `orderby` tinyint(3) DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_ad
-- ----------------------------
INSERT INTO `think_ad` VALUES ('24', '23', '1', '123', '20170416\\363c841674371a9e730e65a085fbdf18.jpg', '0000-00-00', '0000-00-00', '1', '0', '23');
INSERT INTO `think_ad` VALUES ('25', '123', '1', '213', '20170416\\d8f2098b4846f2e087cc2c5dd1575219.jpg', '2016-10-12', '2016-10-12', '1', '0', '100');
INSERT INTO `think_ad` VALUES ('26', '345', '1', '345', '20170416\\f59059c762d959f04f9226eb0c126987.jpg', '2016-10-25', '2016-10-20', '0', '1', '127');

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `portrait` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '头像',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(20) COLLATE utf8_bin DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  `token` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES ('1', 'admin', '218dbb225911693af03a713581a7227f', '20161122\\admin.jpg', '309', '127.0.0.1', '1509678409', 'admin', '1', '1', '1ac2fc424c64cdf80db98a246f439287');
INSERT INTO `think_admin` VALUES ('13', 'test', '218dbb225911693af03a713581a7227f', '20161122\\293c8cd05478b029a378ac4e5a880303.jpg', '1797', '116.23.230.7', '1502432142', 'test', '1', '4', '4ee2e395e9921f515d00599a5f79ae3f');

-- ----------------------------
-- Table structure for think_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `think_ad_position`;
CREATE TABLE `think_ad_position` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_ad_position
-- ----------------------------
INSERT INTO `think_ad_position` VALUES ('23', 'aaa', '30', '1501813046', '1501813046', '1');
INSERT INTO `think_ad_position` VALUES ('22', 'abvc', '15', '1501813036', '1502294001', '1');
INSERT INTO `think_ad_position` VALUES ('25', '首页banner', '50', '1502181832', '1502181832', '1');
INSERT INTO `think_ad_position` VALUES ('26', '6168', '11', '1502182772', '1502182772', '1');

-- ----------------------------
-- Table structure for think_article
-- ----------------------------
DROP TABLE IF EXISTS `think_article`;
CREATE TABLE `think_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章逻辑ID',
  `title` varchar(128) NOT NULL COMMENT '文章标题',
  `cate_id` int(11) NOT NULL DEFAULT '1' COMMENT '文章类别',
  `photo` varchar(64) DEFAULT '' COMMENT '文章图片',
  `remark` varchar(256) DEFAULT '' COMMENT '文章描述',
  `keyword` varchar(32) DEFAULT '' COMMENT '文章关键字',
  `content` text NOT NULL COMMENT '文章内容',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览量',
  `status` tinyint(1) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '文章类型',
  `is_tui` int(1) DEFAULT '0' COMMENT '是否推荐',
  `from` varchar(16) NOT NULL DEFAULT '' COMMENT '来源',
  `writer` varchar(64) NOT NULL COMMENT '作者',
  `ip` varchar(16) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `a_title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of think_article
-- ----------------------------
INSERT INTO `think_article` VALUES ('46', 'PHP人民币金额数字转中文大写的函数代码', '5', '20170416\\8b2ef718255d495dc9668f0dec0224af.jpg', '在网上看到一个非常有趣的PHP人民币金额数字转中文大写的函数，其实质就是数字转换成中文大写，测试了一下，非常有趣，随便输个数字，就可以将其大写打印出来，新手朋友们试一下吧', '人民币转大写', '<p>在网上看到一个非常有趣的PHP人民币金额数字转中文大写的函数，其实质就是数字转换成中文大写，测试了一下，非常有趣，随便输个数字，就可以将其大写打印出来，新手朋友们试一下吧</p><pre class=\"brush:php;toolbar:false\">/**\n*数字金额转换成中文大写金额的函数\n*String&nbsp;Int&nbsp;&nbsp;$num&nbsp;&nbsp;要转换的小写数字或小写字符串\n*return&nbsp;大写字母\n*小数位为两位\n**/\nfunction&nbsp;get_amount($num){\n$c1&nbsp;=&nbsp;&quot;零壹贰叁肆伍陆柒捌玖&quot;;\n$c2&nbsp;=&nbsp;&quot;分角元拾佰仟万拾佰仟亿&quot;;\n$num&nbsp;=&nbsp;round($num,&nbsp;2);\n$num&nbsp;=&nbsp;$num&nbsp;*&nbsp;100;\nif&nbsp;(strlen($num)&nbsp;&gt;&nbsp;10)&nbsp;{\nreturn&nbsp;&quot;数据太长，没有这么大的钱吧，检查下&quot;;\n}&nbsp;\n$i&nbsp;=&nbsp;0;\n$c&nbsp;=&nbsp;&quot;&quot;;\nwhile&nbsp;(1)&nbsp;{\nif&nbsp;($i&nbsp;==&nbsp;0)&nbsp;{\n$n&nbsp;=&nbsp;substr($num,&nbsp;strlen($num)-1,&nbsp;1);\n}&nbsp;else&nbsp;{\n$n&nbsp;=&nbsp;$num&nbsp;%&nbsp;10;\n}&nbsp;\n$p1&nbsp;=&nbsp;substr($c1,&nbsp;3&nbsp;*&nbsp;$n,&nbsp;3);\n$p2&nbsp;=&nbsp;substr($c2,&nbsp;3&nbsp;*&nbsp;$i,&nbsp;3);\nif&nbsp;($n&nbsp;!=&nbsp;&#39;0&#39;&nbsp;||&nbsp;($n&nbsp;==&nbsp;&#39;0&#39;&nbsp;&amp;&amp;&nbsp;($p2&nbsp;==&nbsp;&#39;亿&#39;&nbsp;||&nbsp;$p2&nbsp;==&nbsp;&#39;万&#39;&nbsp;||&nbsp;$p2&nbsp;==&nbsp;&#39;元&#39;)))&nbsp;{\n$c&nbsp;=&nbsp;$p1&nbsp;.&nbsp;$p2&nbsp;.&nbsp;$c;\n}&nbsp;else&nbsp;{\n$c&nbsp;=&nbsp;$p1&nbsp;.&nbsp;$c;\n}&nbsp;\n$i&nbsp;=&nbsp;$i&nbsp;+&nbsp;1;\n$num&nbsp;=&nbsp;$num&nbsp;/&nbsp;10;\n$num&nbsp;=&nbsp;(int)$num;\nif&nbsp;($num&nbsp;==&nbsp;0)&nbsp;{\nbreak;\n}&nbsp;\n}\n$j&nbsp;=&nbsp;0;\n$slen&nbsp;=&nbsp;strlen($c);\nwhile&nbsp;($j&nbsp;&lt;&nbsp;$slen)&nbsp;{\n$m&nbsp;=&nbsp;substr($c,&nbsp;$j,&nbsp;6);\nif&nbsp;($m&nbsp;==&nbsp;&#39;零元&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零万&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零亿&#39;&nbsp;||&nbsp;$m&nbsp;==&nbsp;&#39;零零&#39;)&nbsp;{\n$left&nbsp;=&nbsp;substr($c,&nbsp;0,&nbsp;$j);\n$right&nbsp;=&nbsp;substr($c,&nbsp;$j&nbsp;+&nbsp;3);\n$c&nbsp;=&nbsp;$left&nbsp;.&nbsp;$right;\n$j&nbsp;=&nbsp;$j-3;\n$slen&nbsp;=&nbsp;$slen-3;\n}&nbsp;\n$j&nbsp;=&nbsp;$j&nbsp;+&nbsp;3;\n}&nbsp;\nif&nbsp;(substr($c,&nbsp;strlen($c)-3,&nbsp;3)&nbsp;==&nbsp;&#39;零&#39;)&nbsp;{\n$c&nbsp;=&nbsp;substr($c,&nbsp;0,&nbsp;strlen($c)-3);\n}\nif&nbsp;(empty($c))&nbsp;{\nreturn&nbsp;&quot;零元整&quot;;\n}else{\nreturn&nbsp;$c&nbsp;.&nbsp;&quot;整&quot;;\n}\n}</pre><p>最终实现效果：</p><p><img src=\"/Uploads/ueditor/2015-12-28/1451310141372440.png\" title=\"1451310141372440.png\" alt=\"1449026968974428.png\"/></p>', '1', '1', '1', '1', 'Win 8.1', '轮回', '124.152.7.106', '1449026848', '1492346057');
INSERT INTO `think_article` VALUES ('47', 'Windows下mysql忘记密码的解决方法', '1', '20170416\\f5f5aacefa23b9efb1c81895cb932572.jpg', 'Windows下mysql忘记密码的解决方法', 'mysql', '<p>方法一：</p><p>1、在DOS窗口下输入</p><pre>net&nbsp;stop&nbsp;mysql5</pre><p>&nbsp;</p><p>或</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、开一个DOS窗口，这个需要切换到mysql的bin目录。<br/>一般在bin目录里面创建一个批处理1.bat,内容是cmd.exe运行一下即可就切换到当前目录，然后输入</p><pre>mysqld-nt&nbsp;--skip-grant-tables;</pre><p>&nbsp;</p><p>3、再开一个DOS窗口</p><pre>mysql&nbsp;-u&nbsp;root</pre><p>&nbsp;</p><p>4、输入：</p><pre>use&nbsp;mysql&nbsp;\nupdate&nbsp;user&nbsp;set&nbsp;password=password(&quot;new_pass&quot;)&nbsp;where&nbsp;user=&quot;root&quot;;&nbsp;\nflush&nbsp;privileges;&nbsp;\nexit</pre><p>&nbsp;</p><p>5、使用任务管理器，找到mysqld-nt的进程，结束进程&nbsp;<br/>或下面的步骤<br/>1，停止MYSQL服务，CMD打开DOS窗口，输入 net stop mysql&nbsp;<br/>2，在CMD命令行窗口，进入MYSQL安装目录 比如E:Program FilesMySQLMySQL Server 5.0bin&nbsp;<br/>示范命令:&nbsp;<br/>输入 e:回车,&nbsp;<br/>输入cd &quot;E:Program FilesMySQLMySQL Server 5.0bin&quot;&nbsp;<br/>注意双引号也要输入,这样就可以进入Mysql安装目录了.&nbsp;<br/>3，进入mysql安全模式，即当mysql起来后，不用输入密码就能进入数据库。&nbsp;<br/>命令为：</p><pre>mysqld-nt&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>4，重新打开一个CMD命令行窗口，输入</p><p>mysql -uroot -p，使用空密码的方式登录MySQL（不用输入密码，直接按回车）</p><p>5，输入以下命令开始修改root用户的密码（注意：命令中mysql.user中间有个“点”）</p><p>mysql.user：数据库名.表名<br/>mysql&gt; update mysql.user set password=PASSWORD(&#39;新密码&#39;) where User=&#39;root&#39;;&nbsp;<br/>6，刷新权限表&nbsp;<br/>mysql&gt; flush privileges;&nbsp;<br/>7，退出&nbsp;<br/>mysql&gt; quit</p><p><br/>这样MYSQL超级管理员账号 ROOT已经重新设置好了，接下来 在任务管理器里结束掉 mysql-nt.exe 这个进程，重新启动MYSQL即可！</p><p>（也可以直接重新启动服务器）&nbsp;<br/>MYSQL重新启动后，就可以用新设置的ROOT密码登陆MYSQL了！</p><p>方法二：</p><p>首先在 MySQL的安装目录下 新建一个pwdhf.txt, 输入文本：</p><pre>SET&nbsp;PASSWORD&nbsp;FOR&nbsp;&#39;root&#39;@&#39;localhost&#39;&nbsp;=&nbsp;PASSWORD(&#39;*****&#39;);</pre><p>&nbsp;</p><p>红色部份为 需要设置的新密码&nbsp;<br/>用windows服务管理工具或任务管理器来停止MySQL服务 (任务管理器K掉 mysqld-nt 进程)&nbsp;<br/>Dos命令提示符到 MySQL安装目录下的bin目录 如我的是</p><p>D:Program FilesMySQLMySQL Server 5.1bin&nbsp;<br/>然后运行：</p><pre>mysqld-nt&nbsp;--init-file=../pwdhf.txt</pre><p>&nbsp;</p><p>执行完毕， 停止MySQL数据库服务 (任务管理器K掉 mysqld-nt 进程)，然后再重新以正常模式启动MYSQL 即可</p><hr style=\"color: rgb(51, 51, 51); font-family: Arial; font-size: 14px; line-height: 26px; white-space: normal; background-color: rgb(255, 255, 255);\"/><p>mysql5.1或以上</p><p>1、 首先检查mysql服务是否启动，若已启动则先将其停止服务，可在开始菜单的运行，使用命令：</p><pre>net&nbsp;stop&nbsp;mysql</pre><p>&nbsp;</p><p>2、打开第一个cmd窗口，切换到mysql的bin目录，运行命令：</p><pre>mysqld&nbsp;--defaults-file=&quot;C:Program&nbsp;FilesMySQLMySQL&nbsp;Server&nbsp;5.1my.ini&quot;&nbsp;--console&nbsp;--skip-grant-tables</pre><p>&nbsp;</p><p>注释：</p><p>该命令通过跳过权限安全检查，开启mysql服务，这样连接mysql时，可以不用输入用户密码。&nbsp;<br/>&nbsp;</p><p>&nbsp;</p><p>3、打开第二个cmd窗口，连接mysql：</p><p>输入命令：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>出现：</p><p>Enter password:</p><p>在这里直接回车，不用输入密码。</p><p>然后就就会出现登录成功的信息，</p><p>&nbsp;</p><p>&nbsp;</p><p>4、使用命令：</p><pre>show&nbsp;databases;</pre><p>&nbsp;</p><p>&nbsp;</p><p>5、使用命令切换到mysql数据库：</p><pre>use&nbsp;mysql;</pre><p>&nbsp;</p><p>6、使用命令更改root密码为123456：</p><pre>UPDATE&nbsp;user&nbsp;SET&nbsp;Password=PASSWORD(&#39;123456&#39;)&nbsp;where&nbsp;USER=&#39;root&#39;;</pre><p>&nbsp;</p><p>&nbsp;</p><p>7、刷新权限：</p><pre>FLUSH&nbsp;PRIVILEGES;</pre><p>&nbsp;</p><p>8、然后退出，重新登录：</p><p>quit</p><p>重新登录：</p><pre>mysql&nbsp;-uroot&nbsp;-p</pre><p>&nbsp;</p><p>9、出现输入密码提示，输入新的密码即可登录：</p><p>Enter password: ***********</p><p>显示登录信息： 成功&nbsp; 就一切ok了</p><p>&nbsp;</p><p>10、重新启动mysql服务</p><pre>net&nbsp;start&nbsp;mysql</pre><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '0.0.0.0', '1450339377', '1492346047');
INSERT INTO `think_article` VALUES ('48', '禁止网页复制的代码', '1', '20170416\\c3646031ca540e4217d1228eefe99c4c.jpg', '禁止网页复制的代码', '网页复制', '<p>今天做一网站项目时，客户要求让用户不能复制网站内容，网上搜索了一下，总结成以下二几行代码。其实吧，要是懂的人，这些都是浮云来的，客户就是要让一般人不能复制他的内容资料。</p><pre class=\"brush:html;toolbar:false\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; padding: 9.5px; list-style: none; border: 1px solid rgb(204, 204, 204); overflow: auto; font-family: Menlo, Monaco, Consolas, &#39;Courier New&#39;, monospace; font-size: 13px; line-height: 1.42857; color: rgb(51, 51, 51); word-break: break-all; word-wrap: break-word; border-radius: 4px; background-color: rgb(245, 245, 245);\">&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;&lt;\ntitle\n&gt;禁止网页复制的代码&nbsp;&nbsp;网页禁止右键、禁止查看源代码、禁止复制的代码，试试你的右键、ctrl+c和ctrl+c吧~\n&nbsp;&nbsp;\n&nbsp;&nbsp;&quot;&nbsp;_ue_custom_node_=&quot;true&quot;&gt;</pre><p><br/></p>', '1', '0', '1', '1', 'Win 8.1', '轮回', '0.0.0.0', '1450340150', '1492346038');
INSERT INTO `think_article` VALUES ('49', '如何使用谷歌字体', '1', '20170416\\970c587b487610a793857bc161773f2a.jpg', '如何使用谷歌字体', '谷歌字体', '<p style=\"text-align:center\"><img src=\"/Uploads/ueditor/2015-12-28/1451233062718458.png\" title=\"1451233062718458.png\" alt=\"QQ截图20151228001616.png\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">国内网站使用谷歌字体是不方便的，解决办法如下<br style=\"padding: 0px; margin: 0px;\"/></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">1、将谷歌的地址换成360的</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><a href=\"http://fonts.googleapis.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.googleapis.com</a>&nbsp;换成&nbsp;<a href=\"http://fonts.useso.com/\" rel=\"nofollow\" style=\"padding: 0px; margin: 0px; color: rgb(255, 131, 115); outline: 0px; font-size: 12px;\">http://fonts.useso.com</a></p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">2、只做了第一步还是有问题的，会报错：</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">No &#39;Access-Control-Allow-Origin&#39; header is present on the requested resource</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\">解决办法是给html页面添加头信息</p><p style=\"padding: 0px; margin-top: 8px; margin-bottom: 8px; line-height: 22.5px; letter-spacing: 0.5px; font-size: 12.5px; white-space: normal; word-wrap: break-word; word-break: break-all; color: rgb(51, 51, 51); font-family: &#39;Microsoft YaHei&#39;, Verdana, sans-serif, 宋体; background-color: rgb(255, 255, 255);\"><span style=\"padding: 0px; margin: 0px; color: rgb(70, 70, 70); font-family: Arial，; font-size: 14px; line-height: 21px;\"><meta http-equiv=\"Access-Control-Allow-Origin\" content=\"*\"/></span></p><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '0.0.0.0', '1450764484', '1492346031');
INSERT INTO `think_article` VALUES ('50', 'winForm窗体关闭按钮实现托盘后台运行（类似QQ托盘区运行）', '4', '20170416\\50929a5bfd0a8ecd4e0883172c9814cc.jpg', '今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。 对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。', 'winForm', '<p>今天遇到了一个需求，如果用户不小心点击了“关闭”按钮，但是他的本意不是想要真的关闭这个窗体。</p><p>&nbsp;</p><p>对这个需求完全可以在单击“关闭”按钮的时候弹出一个对话框，来让用户确定是否真的要退出。这是一个很好的解决方法，并且实现也是很容易的。但是人家不想这样，想要拥有类似QQ在托盘区后台运行的那种效果，没办法，只能想办法来实现了。</p><p>&nbsp;</p><p>其实，这个在网上也有很多的实现方法，但是我试了试有些直接复制过来并不能直接运行，或者能运行的吧又没有注释。今天在这里就给大家贴一下我的代码，也有不足之处，希望大家给出意见.</p><p style=\"text-align:center\"><img src=\"/Uploads/ueditor/2015-12-28/1451309750351569.png\" title=\"1451309750351569.png\" alt=\"1450926662631174.png\"/></p><pre class=\"brush:c#;toolbar:false\">using&nbsp;System;\nusing&nbsp;System.Collections.Generic;\nusing&nbsp;System.ComponentModel;\nusing&nbsp;System.Data;\nusing&nbsp;System.Drawing;\nusing&nbsp;System.Linq;\nusing&nbsp;System.Text;\nusing&nbsp;System.Windows.Forms;\nusing&nbsp;System.Windows;\nnamespace&nbsp;winform窗体托盘后台运行\n{\n&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;partial&nbsp;class&nbsp;Form1&nbsp;:&nbsp;Form&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里在窗体上没有拖拽一个NotifyIcon控件，而是在这里定义了一个变量\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;NotifyIcon&nbsp;notifyIcon&nbsp;=&nbsp;null;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;public&nbsp;Form1()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitializeComponent();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//调用初始化托盘显示函数\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;InitialTray();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_Load(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//这里写其他代码\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;窗体关闭的单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;Form1_FormClosing(object&nbsp;sender,&nbsp;FormClosingEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;e.Cancel&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//通过这里可以看出，这里的关闭其实不是真正意义上的“关闭”，而是将窗体隐藏，实现一个“伪关闭”\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;InitialTray()\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//隐藏主窗体\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Hide();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//实例化一个NotifyIcon对象\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon&nbsp;=&nbsp;new&nbsp;NotifyIcon();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标气泡显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.BalloonTipText&nbsp;=&nbsp;&quot;正在后台运行&quot;;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//托盘图标显示的内容\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Text&nbsp;=&nbsp;&quot;窗体托盘后台运行测试程序&quot;;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注意：下面的路径可以是绝对路径、相对路径。但是需要注意的是：文件必须是一个.ico格式\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Icon&nbsp;=&nbsp;new&nbsp;System.Drawing.Icon(&quot;E:/ASP项目/images/3.5&nbsp;inch&nbsp;Floppy.ico&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//true表示在托盘区可见，false表示在托盘区不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//气泡显示的时间（单位是毫秒）\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ShowBalloonTip(2000);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.MouseClick&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.MouseEventHandler(notifyIcon_MouseClick);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////设置二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting1&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单1&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting2&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;二级菜单2&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem&nbsp;setting&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;一级菜单&quot;,&nbsp;new&nbsp;MenuItem[]{setting1,setting2});\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//帮助选项，这里只是“有名无实”在菜单上只是显示，单击没有效果，可以参照下面的“退出菜单”实现单击事件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;help&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;帮助&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//关于选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;about&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;关于&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出菜单项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem&nbsp;exit&nbsp;=&nbsp;new&nbsp;MenuItem(&quot;退出&quot;);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;exit.Click&nbsp;+=&nbsp;new&nbsp;EventHandler(exit_Click);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;////关联托盘控件\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//注释的这一行与下一行的区别就是参数不同，setting这个参数是为了实现二级菜单\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{&nbsp;setting,&nbsp;help,&nbsp;about,&nbsp;exit&nbsp;};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MenuItem[]&nbsp;childen&nbsp;=&nbsp;new&nbsp;MenuItem[]&nbsp;{help,about,exit};\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;notifyIcon.ContextMenu&nbsp;=&nbsp;new&nbsp;ContextMenu(childen);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//窗体关闭时触发\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.FormClosing&nbsp;+=&nbsp;new&nbsp;System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;鼠标单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;notifyIcon_MouseClick(object&nbsp;sender,&nbsp;System.Windows.Forms.MouseEventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//鼠标左键单击\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(e.Button&nbsp;==&nbsp;MouseButtons.Left)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//如果窗体是可见的，那么鼠标左击托盘区图标后，窗体为不可见\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(this.Visible&nbsp;==&nbsp;true&nbsp;)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Visible&nbsp;=&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.Activate();\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;退出选项\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;///&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;private&nbsp;void&nbsp;exit_Click(object&nbsp;sender,&nbsp;EventArgs&nbsp;e)\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;//退出程序\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;System.Environment.Exit(0);&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre><p><br/></p>', '1', '0', '0', '0', 'Win 8.1', '轮回', '124.152.7.106', '1450926579', '1492346022');
INSERT INTO `think_article` VALUES ('67', '太难', '2', '20170810\\cd115e0dd64732861ad62ebd75fd5e15.jpg', '', 'PHP', '<p>W 发士大夫但是</p>', '1', '1', '1', '0', '', '', '', '1501597084', '1502341187');
INSERT INTO `think_article` VALUES ('68', '54254254', '2', '20170824\\dfade61edda20cfd4e10962259466150.png', '5254', '242424', '<p><br/></p><p>2145254254254</p>', '1', '1', '1', '1', '', '', '', '1503569472', '1503569472');

-- ----------------------------
-- Table structure for think_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `think_article_cate`;
CREATE TABLE `think_article_cate` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '分类名称',
  `orderby` varchar(10) DEFAULT '100' COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_article_cate
-- ----------------------------
INSERT INTO `think_article_cate` VALUES ('1', '大鼻孔', '1', '1477140627', '1502266891', '1');
INSERT INTO `think_article_cate` VALUES ('2', '生活随笔', '2', '1477140627', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('3', '热点分享', '3', '1477140604', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('4', '.NET', '4', '1477140627', '1477140627', '1');
INSERT INTO `think_article_cate` VALUES ('5', 'PHP', '5', '1477140627', '1477140627', '0');
INSERT INTO `think_article_cate` VALUES ('6', 'Java', '6', '1477140627', '1477140627', '0');

-- ----------------------------
-- Table structure for think_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group`;
CREATE TABLE `think_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group
-- ----------------------------
INSERT INTO `think_auth_group` VALUES ('1', '超级管理员', '1', '', '1446535750', '1446535750');
INSERT INTO `think_auth_group` VALUES ('4', '系统测试员', '1', '1,2,9,3,30,4,39,5,6,7,27,29,70,75,85', '1446535750', '1509683492');

-- ----------------------------
-- Table structure for think_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_group_access`;
CREATE TABLE `think_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_group_access
-- ----------------------------
INSERT INTO `think_auth_group_access` VALUES ('1', '1');
INSERT INTO `think_auth_group_access` VALUES ('13', '4');

-- ----------------------------
-- Table structure for think_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `think_auth_rule`;
CREATE TABLE `think_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_auth_rule
-- ----------------------------
INSERT INTO `think_auth_rule` VALUES ('1', '#', '系统管理', '1', '1', 'fa fa-gear', '', '0', '1', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('2', 'admin/user/index', '用户管理', '1', '1', '', '', '1', '10', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('3', 'admin/role/index', '角色管理', '1', '1', '', '', '1', '20', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('4', 'admin/menu/index', '菜单管理', '1', '1', '', '', '1', '30', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('5', '#', '数据库管理', '1', '1', 'fa fa-database', '', '0', '2', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('6', 'admin/data/index', '数据库备份', '1', '1', '', '', '5', '50', '1446535750', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('7', 'admin/data/optimize', '优化表', '1', '1', '', '', '6', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('8', 'admin/data/repair', '修复表', '1', '1', '', '', '6', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('9', 'admin/user/useradd', '添加用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('10', 'admin/user/useredit', '编辑用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('11', 'admin/user/userdel', '删除用户', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('12', 'admin/user/user_state', '用户状态', '1', '1', '', '', '2', '50', '1477312169', '1477312169');
INSERT INTO `think_auth_rule` VALUES ('27', 'admin/data/import', '数据库还原', '1', '1', '', '', '5', '50', '1477639870', '1477639870');
INSERT INTO `think_auth_rule` VALUES ('28', 'admin/data/revert', '还原', '1', '1', '', '', '27', '50', '1477639972', '1477639972');
INSERT INTO `think_auth_rule` VALUES ('29', 'admin/data/del', '删除', '1', '1', '', '', '27', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('30', 'admin/role/roleAdd', '添加角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('31', 'admin/role/roleEdit', '编辑角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('32', 'admin/role/roleDel', '删除角色', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('33', 'admin/role/role_state', '角色状态', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('34', 'admin/role/giveAccess', '权限分配', '1', '1', '', '', '3', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('35', 'admin/menu/add_rule', '添加菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('36', 'admin/menu/edit_rule', '编辑菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('37', 'admin/menu/del_rule', '删除菜单', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('38', 'admin/menu/rule_state', '菜单状态', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('39', 'admin/menu/ruleorder', '菜单排序', '1', '1', '', '', '4', '50', '1477640011', '1477640011');
INSERT INTO `think_auth_rule` VALUES ('70', '#', '会员管理', '1', '1', 'fa fa-users', '', '0', '3', '1484103066', '1484103066');
INSERT INTO `think_auth_rule` VALUES ('75', 'admin/member/index', '会员列表', '1', '1', '', '', '70', '20', '1484103304', '1484103304');
INSERT INTO `think_auth_rule` VALUES ('85', 'admin/member/downloadfile', '下载专属桌面', '1', '1', '', '', '75', '50', '1509683458', '1509683458');

-- ----------------------------
-- Table structure for think_config
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` text COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES ('1', 'web_site_title', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('2', 'web_site_description', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('3', 'web_site_keyword', '轮回后台管理系统');
INSERT INTO `think_config` VALUES ('4', 'web_site_icp', '陇ICP备15002349号-1');
INSERT INTO `think_config` VALUES ('5', 'web_site_cnzz', '');
INSERT INTO `think_config` VALUES ('6', 'web_site_copy', 'Copyright © 2017 轮回后台管理系统 All rights reserved.');
INSERT INTO `think_config` VALUES ('7', 'web_site_close', '1');
INSERT INTO `think_config` VALUES ('8', 'list_rows', '10');
INSERT INTO `think_config` VALUES ('9', 'admin_allow_ip', null);
INSERT INTO `think_config` VALUES ('10', 'alisms_appkey', '');
INSERT INTO `think_config` VALUES ('11', 'alisms_appsecret', '');
INSERT INTO `think_config` VALUES ('12', 'alisms_signname', '');

-- ----------------------------
-- Table structure for think_log
-- ----------------------------
DROP TABLE IF EXISTS `think_log`;
CREATE TABLE `think_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4366 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_log
-- ----------------------------
INSERT INTO `think_log` VALUES ('4337', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469529');
INSERT INTO `think_log` VALUES ('4338', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469560');
INSERT INTO `think_log` VALUES ('4339', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469632');
INSERT INTO `think_log` VALUES ('4340', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469748');
INSERT INTO `think_log` VALUES ('4341', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469749');
INSERT INTO `think_log` VALUES ('4342', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469801');
INSERT INTO `think_log` VALUES ('4343', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503469853');
INSERT INTO `think_log` VALUES ('4344', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503470004');
INSERT INTO `think_log` VALUES ('4345', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503470488');
INSERT INTO `think_log` VALUES ('4346', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503473610');
INSERT INTO `think_log` VALUES ('4347', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1503569426');
INSERT INTO `think_log` VALUES ('4348', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505098116');
INSERT INTO `think_log` VALUES ('4349', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505281421');
INSERT INTO `think_log` VALUES ('4350', '1', 'admin', '用户【admin】添加菜单成功', '0.0.0.0', '1', '1505281878');
INSERT INTO `think_log` VALUES ('4351', '1', 'admin', '用户【admin】添加菜单成功', '0.0.0.0', '1', '1505281944');
INSERT INTO `think_log` VALUES ('4352', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505283850');
INSERT INTO `think_log` VALUES ('4354', '1', 'admin', '用户【admin】登录成功', '0.0.0.0', '1', '1505291620');
INSERT INTO `think_log` VALUES ('4355', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509615362');
INSERT INTO `think_log` VALUES ('4356', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509615368');
INSERT INTO `think_log` VALUES ('4357', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509615375');
INSERT INTO `think_log` VALUES ('4358', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509615381');
INSERT INTO `think_log` VALUES ('4359', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509615386');
INSERT INTO `think_log` VALUES ('4360', '1', 'admin', '用户【admin】登录成功', '127.0.0.1', '1', '1509678409');
INSERT INTO `think_log` VALUES ('4361', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509683376');
INSERT INTO `think_log` VALUES ('4362', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509683384');
INSERT INTO `think_log` VALUES ('4363', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509683390');
INSERT INTO `think_log` VALUES ('4364', '1', 'admin', '用户【admin】删除菜单成功', '127.0.0.1', '1', '1509683395');
INSERT INTO `think_log` VALUES ('4365', '1', 'admin', '用户【admin】添加菜单成功', '127.0.0.1', '1', '1509683458');

-- ----------------------------
-- Table structure for think_member
-- ----------------------------
DROP TABLE IF EXISTS `think_member`;
CREATE TABLE `think_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) DEFAULT NULL COMMENT '邮件或者手机',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `sex` int(10) DEFAULT NULL COMMENT '1男2女',
  `password` char(32) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `head_img` text COMMENT '头像',
  `integral` int(11) DEFAULT '0' COMMENT '积分',
  `money` int(11) DEFAULT '0' COMMENT '账户余额',
  `mobile` varchar(11) DEFAULT NULL COMMENT '认证的手机号码',
  `create_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后一次登录',
  `login_num` varchar(15) DEFAULT NULL COMMENT '登录次数',
  `status` tinyint(1) DEFAULT NULL COMMENT '1正常  0 禁用',
  `closed` tinyint(1) DEFAULT '0' COMMENT '0正常，1删除',
  `token` char(32) DEFAULT '0' COMMENT '令牌',
  `session_id` varchar(20) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `unicount` varchar(6) DEFAULT NULL COMMENT '//专属码',
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=212072 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_member
-- ----------------------------
INSERT INTO `think_member` VALUES ('212066', null, '。', '1', null, '1', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKKVDMUia0QkgSat7zxvXWDZaK5qu1oLmDia84FHZonzLDFrEywGia1g3a6rfbg28xytjAW3pqoA58g/0', '0', '0', null, '1509610681', '1509613738', null, null, '0', '0', null, 'okRTqvpPRPq2WXM_1kXSAcQSZx2g', '', null);
INSERT INTO `think_member` VALUES ('212067', null, '西瓜桥', '1', null, '1', 'http://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELKKVDMUia0QkgSat7zxvXWDZaK5qu1oLmDia84FHZonzLDFrEywGia1g3a6rfbg28xytjAW3pqoA58g/0', '0', '0', null, '1509612045', '1509613338', null, null, '0', '0', null, 'okRTqvqRF0wqAu5zb6bshEJ5H48c', '', null);
INSERT INTO `think_member` VALUES ('212068', null, 'Klein_Blue', '1', null, '1', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDKGLJp8rsvrwuiaDkdBDo9zP6Vb7dvaCicwKDEibNusz44h7ILG2AFAtKllYKenhr8iaDZ498elwtkMw/0', '0', '0', null, '1509612362', '1509612362', null, null, '0', '0', null, 'okRTqvltI75BOta8p8xb_c096AnE', '', null);
INSERT INTO `think_member` VALUES ('212069', null, 'WebYs', '1', null, '1', 'http://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoIbss8MuKPicGC5ibA9LssJ6SPSsDIAP3TeKzjHZ13cTO4ibvJHeUFLhp0A36ia2nwRHW7r037icUGfPg/0', '0', '0', null, '1509612673', '1509613557', null, null, '0', '0', null, 'okRTqvtuF8edafszy3PlxVXHm8us', null, null);
INSERT INTO `think_member` VALUES ('212070', null, 'Frank', '0', null, '1', 'http://wx.qlogo.cn/mmopen/vi_32/BZ0iakAttMwIZJROwBx3d1oNh3icF4TJA3S3c6TUSCwgGlqjTpBibUKvGD1nOCv5JZvPXic9t9j8unG6hs3bbYPM3g/0', '0', '0', null, '1509613299', '1509613413', null, null, '0', '0', null, 'okRTqviXTlp_kbc2VuQlfw99-FXY', null, null);
INSERT INTO `think_member` VALUES ('212071', null, '老K', '1', null, '1', 'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMWl3EYJ7sNU1oCuQ1tZia9NWjXgYo84Chgde9YZ3XR4AZXW7Y70qiau9uh2onCWba7v7AEzOFhbWQ/0', '0', '0', null, '1509613601', '1509613601', null, null, '0', '0', null, 'okRTqvvt9sAqHsu1sggFvyZaXJ-8', null, null);

-- ----------------------------
-- Table structure for think_member_group
-- ----------------------------
DROP TABLE IF EXISTS `think_member_group`;
CREATE TABLE `think_member_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言Id',
  `group_name` varchar(32) NOT NULL COMMENT '留言评论作者',
  `status` tinyint(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '留言回复时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of think_member_group
-- ----------------------------
INSERT INTO `think_member_group` VALUES ('1', '会员', '1', '1441616559', '1509615286');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(20) DEFAULT NULL COMMENT '认证的手机号码',
  `nickname` varchar(32) DEFAULT NULL COMMENT '昵称',
  `password` char(32) DEFAULT NULL,
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` tinyint(1) DEFAULT NULL COMMENT '1激活  0 未激活',
  `token` varchar(255) DEFAULT '0' COMMENT '令牌',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', '18693281982', '田建龙', 'e10adc3949ba59abbe56e057f20f883e', 'http://123.56.237.22:8888/group1/M00/00/08/ezjtFlj4IHyAcjlzAABDms0T3Kk671.jpg', '1', 'LWBYIiLWinNiulNXYD1UzGgfynNx+gy/zmq5Ega0E0we4a0WyB8UaG4x+VKRoc9CG4e1BXrqZww=');
INSERT INTO `think_user` VALUES ('2', '18993075721', '账号1', 'e10adc3949ba59abbe56e057f20f883e', 'http://opgkfon0o.bkt.clouddn.com/108.png', '1', 'VslU7gKYuddZFPq4ssWLZCNYBsi3YQIicyG1jm5pUfvZHI4qw03b3A2sygA4efLyWHRkYBQX8LAscwsA7sLzhg==');
INSERT INTO `think_user` VALUES ('3', '15095340657', '呼丽华', 'e10adc3949ba59abbe56e057f20f883e', 'http://123.56.237.22:8888/group1/M00/00/00/ezjtFliGwvWAaYeXAABu1D1rZNo655.jpg', '1', '2d8471d156a9e6db155145571cedea5a');

-- ----------------------------
-- Event structure for ceshi
-- ----------------------------
DROP EVENT IF EXISTS `ceshi`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `ceshi` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-07-19 09:51:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE think_user set status='2' where id='1'
;;
DELIMITER ;
