<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace app\home\controller;
use app\home\model\IndexModel;
use think\Db;
use think\Controller;
use think\Cookie;
use app\admin\model\MemberModel;
use think\Request;
class Arequest extends controller
{
    //上传生成专属码
    public function getcode() {
        if(Cookie::has('openid')){
            
        
         $member=new MemberModel();
        
         $where=[
             'openid'=> cookie::get('openid')
                 ];
         if(Cookie::has('imgurl')){
            
             $user=$member->where($where)->find();
                
          if(empty($user['unicount'])){
               //生成专属码
             $num=time();
             $num=substr($num,-6);
             while(true){
                 $map=[
                   'openid'=> cookie::get('openid'),
                    'unicount'=>$num
                 ];
                $count=$member->getAllCount($map);
                if($count){
                    $num++;
                }else{
                    break;
                }
             }
           
           $data=[
             'photo'=>cookie::get('imgurl'),
              'unicount'=>$num
            ]; 
          }else{
              
              $data=[
             'photo'=>cookie::get('imgurl'),
            ]; 
          }
            $member->save($data,$where);
            echo json_encode(['code'=>1,'msg'=>'上传成功']);
                    exit;
         }else{
             echo json_encode(['code'=>0,'msg'=>'专属桌面异常，请重新生成专属桌面']);
                   exit;
         }
         
        }else{
            echo json_encode(['code'=>1,'msg'=>'请登录']);
        }
    }
    
       /*
     * 下载专属桌面
     */
       public function downloadfile(Request $request){
           
        $member = new MemberModel(); 
       $hash_str=$request->param('id');
      
       $file_data= $member->where(['id'=>$hash_str])->find();
       if(empty($file_data['photo'])){
           echo '<script>alert(\'该用户无专属桌面!\')</script>';
           exit;
        };
        $file ='http://'.$_SERVER['SERVER_NAME'].$file_data['photo'];
        $ext=pathinfo($file, PATHINFO_EXTENSION); 
        if(empty($file_data['unicount'])){
           echo '<script>alert(\'该用户无专属号码!\')</script>';
           exit;
        };
       
        $filename = $file_data['unicount'].'.'.$ext;
         //header("Location:".$file);exit;
     
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header("Content-type:text/html;charset=utf-8");
        header('Content-Disposition: attachment; filename='. $filename);
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        readfile($file);
        echo '<script>window.close();</script>';
        exit;
    }
    
}