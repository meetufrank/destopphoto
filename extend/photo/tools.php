<?php
function HexToRGB($colour) {
    if ($colour [0] == '#') {
        $colour = substr ( $colour, 1 );
    }
    if (strlen ( $colour ) == 6) {
        list ( $r, $g, $b ) = array (
                $colour [0] . $colour [1],
                $colour [2] . $colour [3],
                $colour [4] . $colour [5] 
        );
    } elseif (strlen ( $colour ) == 3) {
        list ( $r, $g, $b ) = array (
                $colour [0] . $colour [0],
                $colour [1] . $colour [1],
                $colour [2] . $colour [2] 
        );
    } else {
        return false;
    }
    $r = hexdec ( $r );
    $g = hexdec ( $g );
    $b = hexdec ( $b );
    return array (
            'red' => $r,
            'green' => $g,
            'blue' => $b 
    );
}
function RGBToHex($rgb) {
    $regexp = "/^rgb\(([0-9]{0,3})\,\s*([0-9]{0,3})\,\s*([0-9]{0,3})\)/";
    $re = preg_match ( $regexp, $rgb, $match );
    $re = array_shift ( $match );
    $hexColor = "#";
    $hex = array (
            '0',
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            'A',
            'B',
            'C',
            'D',
            'E',
            'F' 
    );
    for($i = 0; $i < 3; $i ++) {
        $r = null;
        $c = $match [$i];
        $hexAr = array ();

        while ( $c > 16 ) {
            $r = $c % 16;
            $c = ($c / 16) >> 0;
            array_push ( $hexAr, $hex [$r] );
        }
        array_push ( $hexAr, $hex [$c] );

        $ret = array_reverse ( $hexAr );
        $item = implode ( '', $ret );
        $item = str_pad ( $item, 2, '0', STR_PAD_LEFT );
        $hexColor .= $item;
    }
    return $hexColor;
}
function readtatlenumber(){
    $filename = "numbers.txt";
    $handle = fopen($filename, "r");//读取二进制文件时，需要将第二个参数设置成'rb'
    
    //通过filesize获得文件大小，将整个文件一下子读到一个字符串中
    $contents = fread($handle, filesize ($filename));
    fclose($handle);
    return $contents;
}
function writenumber($number){
    $myfile = fopen("numbers.txt", "w") or die("Unable to open file!");
    $txt = $number;
    fwrite($myfile, $txt);
    fclose($myfile);
}
//清理缓存文件 清理十年前生成的文件
function clearcachefiles($path){
    foreach(glob($path) as $afile){ 
        if(is_dir($afile)) { 
            clearcachefiles($afile.'/*'); 
        }else{ 
            echo $afile.'<br />'; 
            //获取文件修改时间
            $ctime=filectime($afile);
            $subtime = time()-$ctime;
            //如果时间已经过去20分钟删除文件
            // echo "当前时间：".time().'<br />';
            // echo "创建时间：".$ctime.'<br />';
            if ($subtime > 180) {
               unlink($afile); 
            }
            
        } 
    } 
}
/**
 * 处理成圆图片,如果图片不是正方形就取最小边的圆半径,从左边开始剪切成圆形
 * @param  string $imgpath [description]
 * @return [type]          [description]
 */
function yuan_img($imgpath = 'logo.png') {
    $ext     = pathinfo($imgpath);
    $src_img = null;
    switch ($ext['extension']) {
    case 'jpg':
    case 'jpeg':
        $src_img = imagecreatefromjpeg($imgpath);
        break;
    case 'png':
        $src_img = imagecreatefrompng($imgpath);
        break;
    }
    $wh  = getimagesize($imgpath);
    $w   = $wh[0];
    $h   = $wh[1];
    $w   = min($w, $h);
    $h   = $w;
    $img = imagecreatetruecolor($w, $h);
    //这一句一定要有
    imagesavealpha($img, true);
    //拾取一个完全透明的颜色,最后一个参数127为全透明
    $bg = imagecolorallocatealpha($img, 255, 255, 255, 127);
    imagefill($img, 0, 0, $bg);
    $r   = $w / 2; //圆半径
    $y_x = $r; //圆心X坐标
    $y_y = $r; //圆心Y坐标
    for ($x = 0; $x < $w; $x++) {
        for ($y = 0; $y < $h; $y++) {
            $rgbColor = imagecolorat($src_img, $x, $y);
            if (((($x - $r) * ($x - $r) + ($y - $r) * ($y - $r)) < ($r * $r))) {
                imagesetpixel($img, $x, $y, $rgbColor);
            }
        }
    }
    return $img;
}
function imageCreateFromAny($filepath) { 
    $type = exif_imagetype($filepath); // [] if you don't have exif you could use getImageSize() 
    $allowedTypes = array( 
        1,  // [] gif 
        2,  // [] jpg 
        3,  // [] png 
        6   // [] bmp 
    ); 
    if (!in_array($type, $allowedTypes)) { 
        return false; 
    } 
    switch ($type) { 
        case 1 : 
            $im = imageCreateFromGif($filepath); 
        break; 
        case 2 : 
            $im = imageCreateFromJpeg($filepath); 
        break; 
        case 3 : 
            $im = imageCreateFromPng($filepath); 
        break; 
        case 6 : 
            $im = imageCreateFromBmp($filepath); 
        break; 
    }    
    return $im;  
} 

function hecheng_img($dst_path,$src_path,$srcposx,$srcposy){
    //创建图片的实例
    $dst = imageCreateFromAny($dst_path);
    $src = imageCreateFromAny($src_path);
    
     //创建一个新的，和大图一样大的画布
    $image_3=imageCreatetruecolor(imagesx($dst),imagesy($dst));

    imagesavealpha($image_3, true);
    //为真彩色画布创建白色背景，再设置为透明
    // $colorbg = imagecolorallocate($image_3, 255, 255, 255);
    // imagefill($image_3, 0, 0, $colorbg);
    // imageColorTransparent($image_3, $colorbg);
    $bg = imagecolorallocatealpha($image_3, 255, 255, 255, 127);
    imagefill($image_3, 0, 0, $bg);
    //先拷贝jpg 后拷贝png
    //imagecopymerge($dst, $src, $myimgposx, $myimgposy, 0, 0,$src_w, $src_h, 100);
    imagecopyresampled($image_3,$dst, 0,0,0,0,imagesx($dst),imagesy($dst),imagesx($dst),imagesy($dst));
    imagecopy($image_3,$src,$srcposx,$srcposy,0,0,imagesx($src),
                   imagesy($src));
    return $image_3;
}
//图片添加文字
function addtext_img($text,$value,$bgfile){
    $text1 = $text;
    
    if ($value['fangxiang'] == 'Y') {
      //文字竖形排版
      preg_match_all("/./u", $text1, $arr); 
      $arrtxt='';
      foreach ($arr[0] as $key => $val) {
        $arrtxt = $arrtxt . $val . "\n";
      }
      $text1 = $arrtxt;
      // print_r($arr[0]);
      // echo $text1;
      // echo $text1;
      // exit();
    }
    //设置字体的路径
    $font = $value['fontname'];

    list($bg_w, $bg_h) = getimagesize($bgfile);
    $im = imagecreatetruecolor($bg_w,$bg_h);
    $bg = imagecreatefromjpeg($bgfile);
    imagecopy($im,$bg,0,0,0,0,$bg_w,$bg_h);
    imagedestroy($bg);
    $colors=HexToRGB($value['color']);
    $black = imagecolorallocate($im, $colors['red'], $colors['green'], $colors['blue']);
    //写入文字
    //修改写入文字的坐标位置 修改为读取配置
    imagettftext($im, $value['textsize'], $value['textangel'], $value['textx'], $value['texty'], $black, $font, $text1);

    return $im;
}

function img_resize( $tmpname, $size, $save_dir, $save_name, $maxisheight = 0 )
    {
    $save_dir     .= ( substr($save_dir,-1) != "/") ? "/" : "";
    $gis        = getimagesize($tmpname);
    $type        = $gis[2];
    switch($type){
        case "1": $imorig = imagecreatefromgif($tmpname); break;
        case "2": $imorig = imagecreatefromjpeg($tmpname);break;
        case "3": $imorig = imagecreatefrompng($tmpname); break;
        default:  $imorig = imagecreatefromjpeg($tmpname);
    }
    $x = imagesx($imorig);
    $y = imagesy($imorig);
    $woh = (!$maxisheight)? $gis[0] : $gis[1] ;  
    if($woh <= $size){
        $aw = $x;
        $ah = $y;
    }else{
        if(!$maxisheight){
            $aw = $size;
            $ah = $size * $y / $x;
        } else {
            $aw = $size * $x / $y;
            $ah = $size;
        }
    } 
    $im = imagecreatetruecolor($aw,$ah);
    if (imagecopyresampled($im,$imorig , 0,0,0,0,$aw,$ah,$x,$y))
        if (imagejpeg($im, $save_dir.$save_name))
        return true;
        else
        return false;
}//img_resize
// header("content-type:image/png");
// $imgg = yuan_img();
// imagepng($imgg);
// imagedestroy($imgg);
