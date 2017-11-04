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
class Arequest extends controller
{
    //上传生成专属码
    public function getcode() {
        if(Cookie::has('openid')){
            
        
         $member=new MemberModel();
         $map=[
             'openid'=> cookie::get('openid')
                 ];
         $user=$member->where($map)->find();
                
          if(!empty($user['unicount'])){
                   echo json_encode(['code'=>0,'msg'=>'您已生成专属码，无需再次生成']);
                   exit;
                }
         
         if(Cookie::has('imgurl')){
              
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
             $where=[
             'openid'=> cookie::get('openid')
                 ];
           $data=[
             'photo'=>cookie::get('imgurl'),
              'unicount'=>$num
            ]; 
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
    
}