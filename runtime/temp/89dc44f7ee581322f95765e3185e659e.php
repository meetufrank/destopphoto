<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:62:"D:\www\lunhui\public/../application/home\view\index\index.html";i:1510291554;s:68:"D:\www\lunhui\public/../application/home\view\public\footcommon.html";i:1510132454;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<title>首页</title>
<style> 
html,body{
	margin:0;
	padding:0;
	width:100%;
	height:100%;
}
body{
	background:url('http://images.meetv.com.cn/wxphoto/img/1.jpg?imageslim');
	background-size:cover;
	background-repeat:no-repeat;
	background-position:center;
}
.next-button1{
	width: 36%;
    height: 100px;
/*    border: 1px solid red;
    color: red;*/
    position: absolute;
    bottom: 40%;
}
.next-button1s{
	width: 36%;
    height:80px;
/*    border: 1px solid red;
    color:white;*/
    right: 0;
    position: absolute;
    bottom:45%;
}
</style>  
</head>
<body class="body-bgimg1">
	<div class="next-button1" onClick="NextPage();"></div>
	<div class="next-button1s" onClick="NextPages();"></div>
	<script type="text/javascript">
		function NextPage(){
			window.location.href="<?php echo url('Index/index2'); ?>";
		}

		function NextPages(){
			window.location.href="<?php echo url('Index/index4'); ?>";
		}
	</script>
        <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">  
         wx.config({
        debug: false,
        appId: '<?php echo $signPackage['appId']; ?>',
        timestamp: '<?php echo $signPackage['timestamp']; ?>',
        nonceStr: '<?php echo $signPackage['nonceStr']; ?>',
        signature: '<?php echo $signPackage['signature']; ?>',
        jsApiList: [
            // 所有要调用的 API 都要加到这个列表中
            'checkJsApi',
            'openLocation',
            'getLocation',
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareQZone'
          ]
    });
wx.ready(function () {
        wx.onMenuShareAppMessage({
          title: 'FY18 RTG Greater China Mid-year Conference',
          desc: '我的桌面我定义',
          link: '<?php echo $drumpurl; ?>',
          imgUrl: '<?php echo $imgurl; ?>',
          trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            // alert('用户点击发送给朋友');
          },
          success: function (res) {
            // alert('已分享');
          },
          cancel: function (res) {
            // alert('已取消');
          },
          fail: function (res) {
          // alert(JSON.stringify(res));
          }
        });

        wx.onMenuShareTimeline({
          title: 'FY18 RTG Greater China Mid-year Conference ',
          link: '<?php echo $drumpurl; ?>',
          imgUrl: '<?php echo $imgurl; ?>',
          trigger: function (res) {
            // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
            // alert('用户点击分享到朋友圈');
          },
          success: function (res) {
           //alert('已分享');
          },
          cancel: function (res) {
            // alert('已取消');
          },
          fail: function (res) {
            // alert(JSON.stringify(res));
          }
        });
        wx.onMenuShareQZone({
    title: 'FY18 RTG Greater China Mid-year Conference ',
          desc: '我的桌面我定义',
          link: '<?php echo $drumpurl; ?>',
          imgUrl: '<?php echo $imgurl; ?>',
    success: function () { 
       // 用户确认分享后执行的回调函数
    },
    cancel: function () { 
        // 用户取消分享后执行的回调函数
    }
});
wx.onMenuShareQQ({
    title: 'FY18 RTG Greater China Mid-year Conference ',
          desc: '我的桌面我定义',
          link: '<?php echo $drumpurl; ?>',
          imgUrl: '<?php echo $imgurl; ?>',
    success: function () { 
       // 用户确认分享后执行的回调函数
    },
    cancel: function () { 
       // 用户取消分享后执行的回调函数
    }
});


});
</script>
</body>
</html>