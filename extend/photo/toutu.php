<?php
namespace photo;

class toutu
{
 
    
function makeimg($data) {
  /******************************************************************************
    参数说明:
    使用说明:
    1. 将PHP.INI文件里面的"extension=php_gd2.dll"一行前面的;号去掉,因为我们要用到GD库;
    2. 将extension_dir =改为你的php_gd2.dll所在目录;
    ******************************************************************************/
//ini_set("display_errors", "On");
//
//error_reporting(E_ALL | E_STRICT);
ob_clean(); // --清空（擦掉）输出缓冲区

    include('tools.php');
    include('imgzip.php');
    include('imgblur.php');
    //测试数据
    // $data = array(
    //     'pic' => ,
    // );



    $picname=$data['bgimg']['url'];
    //输出图片
    $timestamp = $this->msectime(); 
    $this->file2dir($picname, ROOT_PATH.'public/uploads/destop/',$timestamp.'.jpg');
    $picname=ROOT_PATH.'public/uploads/destop/'.$timestamp.'.jpg';
    $pic2name=$data['img']['url'];

  

    //resize($picname,$data['bgimg']['width'],$data['bgimg']['height']);
     updatesize($picname,$data['bgimg']['width'],$data['bgimg']['height']);
    updatesize($pic2name,$data['img']['width'],$data['img']['height']);
 
    $dst_path = $picname;
    $dst_path2=$pic2name;


   
    //背景图上添加默认模糊图
    //背景加模糊效果
    // $headimg = imageCreateFromAny($dst_path); 
    // $newHead = imagecreatetruecolor($bg_w, $bg_h); 
    // //2.上色 
    // $color=imagecolorallocatealpha($newHead,0,0,0,$myimgalpha); 
    // //3.设置透明 
    // imagefill($newHead,0,0,$color);
    // imagecopyresampled($headimg, $newHead, 0, 0, 0, 0, $bg_w, $bg_h, $bg_w, $bg_h);
    // $timestamp1 = time(); 
    // imagejpeg($headimg,$dst_path);  
    // imagedestroy($headimg);
    //背景图设置高斯模糊
//    $image_blur = new \image_blur();  
//  
//    $image_blur->gaussian_blur($dst_path,null,null,0); 
//  
//    $toubg =  $dst_path ;
//     
//  
//    $image_blur->gaussian_blur($dst_path2,null,null,0); 
//  
//    $toubg2 =  $dst_path2 ;
    //添加透明底图
//    if ($touimg != '') {
//
//        $image_tou = hecheng_img($dst_path,$touimg,0,0);
//        //输出图片
//        $timestamptou = time(); 
//        imagejpeg($image_tou, 'cache/'."$timestamptou.jpg"); 
//        imagedestroy($image_tou);
//        $toubg = 'cache/'."$timestamptou.jpg";
//    }
   

    //添加头像到底图上
    //$image_3 = hecheng_img($toubg,$src_path,$myimgposx,$myimgposy);
    $image_3 = hecheng_img($dst_path,$dst_path2,$data['img']['x'],$data['img']['y']);
    
    //输出图片
    $timestamp0 = $this->msectime(); 
   
    imagejpeg($image_3, ROOT_PATH.'public'.'/uploads/photo/'."$timestamp0.jpg"); 
    imagedestroy($image_3);
     unlink($pic2name);
    unlink($picname);
   
   return '/uploads/photo/'.$timestamp0.'.jpg';

}
  //返回当前的毫秒时间戳
        function msectime() {
           list($msec, $sec) = explode(' ', microtime());
           $msectime =  (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
           return $msectime;
    }
//复制图片  
function file2dir($sourcefile, $dir,$filename){  
     if( ! file_exists($sourcefile)){  
         return false;  
     }  
     //$filename = basename($sourcefile);  
     return copy($sourcefile, $dir .''. $filename);  
}  

   }
