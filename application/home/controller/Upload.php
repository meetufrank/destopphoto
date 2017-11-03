<?php
namespace app\home\controller;
use think\Db;
use think\Controller;
class Upload extends controller
{

    public function uploadimg(){
      if(isset($_FILES["file"])){
        $file = $_FILES["file"];
        if(!isset($file['tmp_name']) || !$file['tmp_name']) {
            echo json_encode(['code' => 401, 'msg' => '没有文件上传']);
            exit;
        }
        if($file["error"] > 0) {
            echo json_encode(['code' => 402, 'msg' => $file["error"]]);
            exit;
        }
        $upload_path = $_SERVER['DOCUMENT_ROOT']."/uploads/photo/";
        $file_path   = 'http://' . $_SERVER['HTTP_HOST']."/uploads/photo/";
        if(!is_dir($upload_path)){
            echo json_encode(['code' => 403, 'msg' => '上传目录不存在']);
            exit;
        }
        $time= $this->msectime();
        $ext=pathinfo($file['name'], PATHINFO_EXTENSION); 
        if(move_uploaded_file($file["tmp_name"], $upload_path.$time.'.'.$ext)){
            echo json_encode(['code' => 200, 'src' => $file_path.$time.'.'.$ext]);
            exit;
        }else{
            echo json_encode(['code' => 404, 'msg' => '上传失败']);
            exit;
        }
        }
    }
    //返回当前的毫秒时间戳
        function msectime() {
           list($msec, $sec) = explode(' ', microtime());
           $msectime =  (float)sprintf('%.0f', (floatval($msec) + floatval($sec)) * 1000);
           return $msectime;
        }

}
