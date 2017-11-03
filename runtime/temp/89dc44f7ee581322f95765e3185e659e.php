<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:62:"D:\www\lunhui\public/../application/home\view\index\index.html";i:1509690026;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>测试demo</title>
    <link rel="stylesheet" type="text/css" href="__UPLOAD__/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="__UPLOAD__/css/style.css" />
    <script type="text/javascript" src="__UPLOAD__/js/jquery.js"></script>
    
    <!--富文本控件需要引入jquery,下方引入顺序不要错-->
    <link rel="stylesheet" href="__UPLOAD__/css/bootstrap.min.css">
    <script src="__UPLOAD__/summernote-master/dist/popper.min.js"></script>
    <script src="__UPLOAD__/js/bootstrap.min.js"></script>
    <link href="__UPLOAD__/summernote-master/dist/summernote-bs4.css" rel="stylesheet">
    <script src="__UPLOAD__/summernote-master/dist/summernote-bs4.js"></script>
    <style type="text/css">
    /*编辑字体控件样式*/
    .card{
      max-width: 90%;
      margin: 0 auto;
      z-index: 99999;
    }
    .double-button{
      width: 100%;
      text-align: center;
      margin-bottom:5px;
      margin-top: 3px;
    }
    .input-summer{  
      width:94%;  
      min-height: 100px; 
      outline:none;
      border-radius:4px;
      padding: 5px;
      margin: 0 auto;
      z-index: 9999;
    }
    .input-summer-border{
      border:1px solid #e6e6e6; 
    }  
    .input-summer:empty::before{  
      color:lightgrey;  
      content:attr(placeholder);
    }
    /*上传图片插件*/
    .js_showBox {
      width:95%;
      height: auto; 
      margin: 0 auto;
      text-align: center;
      margin-top: 10px;
      border-radius:4px;
      position: relative;
      z-index: 9998;
    }
    .js_showBox_height{
      min-height: 320px;
    }
    .js_showBox_border{
      border:2px solid #e6e6e6;
    }
    .js_showBox img {
/*      width: 100px;
      height: 100px;*/
    }
    .btn-upload {
      width: 150px;
      margin: 0 auto;
      margin-top: 1rem;
      margin: 0 auto;
    }
    .btn-upload-new{
      width: 100%;
      margin-top: -55%;
      z-index: 995;
      position: absolute;
      text-align: center;
    }
    .btn-upload-new .a-upload-new{
      padding:0px 10px;
      height:100px;
      line-height:100px;
      position: relative;
      cursor: pointer;
      color: #888;
      background: #fafafa;
      border: 1px solid #ddd;
      border-radius: 4px;
      overflow: hidden;
      display: inline-block;
      text-decoration:none !important;
      outline: none;
    }
    .a-upload-new input{
      position: absolute;
      font-size: 100px;
      right: 0;
      top: 0;
      opacity: 0;
      filter: alpha(opacity=0);
      cursor: pointer;
      outline: none;
      text-decoration:none !important;
    }
    .a-upload {
      padding:0px 10px;
      height:30px;
      line-height:30px;
      position: relative;
      cursor: pointer;
      color: #888;
      background: #fafafa;
      border: 1px solid #ddd;
      border-radius: 4px;
      overflow: hidden;
      display: inline-block;
      text-decoration:none !important;
      outline: none;
    }
    .a-upload input {
      position: absolute;
      font-size: 100px;
      right: 0;
      top: 0;
      opacity: 0;
      filter: alpha(opacity=0);
      cursor: pointer;
      outline: none;
      text-decoration:none !important;
    }

    </style>
</head>
<body>
<div class="control-group js_uploadBox" id="center" onClick="a()">
  <div class="js_showBox js_showBox_height js_showBox_border" id="js_showBox">
    <img class="js_logoBox" src="" style="display:none;">
  </div>
    
    <div class="btn-upload" style="display: none;">
        <a href="javascript:;" class="a-upload">
        <input class="js_upFile" type="file" id="b" name="file">点击这里上传照片
        </a>
    </div>

    <div class="btn-upload-new">
        <a href="javascript:;" class="a-upload-new">
        <input class="js_upFile-new">请先上传图片,再输入文字
        </a>
    </div>
</div>
<div class="double-button">
  <button id="edit" class="btn btn-primary" onclick="edit()" type="button">编辑格式</button>
  <button id="save" class="btn btn-primary" onclick="save()" type="button">保存文字</button>
</div>
<div class="click2edit input-summer input-summer-border" contenteditable="true" placeholder="先设置下格式再输入吧" id="removeborder"></div>
<script src="__UPLOAD__/js/draggabilly.pkgd.min.js"></script>
<!--<script src="__UPLOAD__/js/jquery.uploadView.js"></script> -->
<script src="__UPLOAD__/js/upload.js"></script>
<script>
//编辑字体方法 
var edit = function() {
      $('.click2edit').summernote({
         toolbar: [
          ['style', ['bold', 'italic', 'underline']],
          ['fontsize', ['fontsize']],
          ['color', ['color']],
        ],
        placeholder: '先设置格式再输入',
        tabsize: 2,
        height: 100,
        focus: true,
        });
};
$("#edit").click();
var save = function() {
      var markup = $('.click2edit').summernote('code');
      $('.click2edit').summernote('destroy');
      if($("#removeborder").text()==""){
      	alert("请输入文字");
      	$("#edit").click();
      }else{
      	$("#removeborder").removeClass("input-summer-border");
      }
};
//拖拽控件方法 
$(function(){
  $('.click2edit').draggabilly();
});
//上传插件方法 
function a(){
  document.getElementById('b').click();
  return false;
}
//$(".js_upFile").uploadView({
//  uploadBox: '.js_uploadBox',//设置上传框容器
//  showBox : '.js_showBox',//设置显示预览图片的容器
//  width : 100, //预览图片的宽度，单位px
//  height : 100, //预览图片的高度，单位px
//  allowType: ["gif", "jpeg", "jpg", "bmp", "png"], //允许上传图片的类型
//  maxSize :10, //允许上传图片的最大尺寸，单位M
//  success:function(e){
//    //$(".js_uploadText").text('更改');
//    // layer.open({
//    //   content: '图片上传成功'
//    //   ,skin: 'msg'
//    //   ,time: 1 
//    //   });
//    alert('上传成功');
//    $("#js_showBox").removeClass("js_showBox_height js_showBox_border");
//  }
//});
$(".js_upFile").ajaxImageUpload({
    url: '<?php echo url('upload/uploadimg'); ?>', //上传的服务器地址
    maxNum: 3, //允许上传图片数量
    hidenInputName:'', // 上传成功后追加的隐藏input名，注意不要带[]，会自动带[]，不写默认和上传按钮的name相同
    zoom: true, //允许上传图片点击放大
    allowType: ["gif", "jpeg", "jpg", "bmp",'png'], //允许上传图片的类型
    maxSize :2, //允许上传图片的最大尺寸，单位M
    before: function () {
        
    },
    success:function(data){
       // alert('上传成功回调函数');
        console.log(data);
        if(data['code'] ){
            if(data['code']!=200){
                alert(data['msg']);
            }else{
                $(".js_logoBox").attr('src',data['src']);
    
                $(".js_logoBox").attr('style','display:block;width:100%;height:100%');
                $("#js_showBox").removeClass("js_showBox_height js_showBox_border");
            }
            
        }
    },
    error:function (e) {
        //alert('上传失败回调函数');
       // console.log(e);
    }
});
</script>
</body>
</html>
