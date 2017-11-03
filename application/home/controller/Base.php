<?php
namespace app\home\controller;
use app\home\model\BaseModel;
use think\Controller;
use weixin\userinfo;
use think\Cookie;
use app\admin\model\MemberModel;
class Base extends Controller
{
    public function _initialize()
    {
      

       //if(!Cookie::has('openid')){
            
       
        if (!isset($_GET["code"])){
            $this->get_code();
            exit();
        }else{
            $weixin = new userinfo();
            $access_token = $weixin->oauth2_access_token($_GET["code"]);
            if(isset($access_token['openid'])){
                $openid = $access_token['openid'];
                $token=$access_token['access_token'];
                $info = $weixin->oauth2_get_user_info($token,$openid);
                $nickname=$info['nickname'];//昵称
                $headimgurl=$info['headimgurl'];//头像
                $sex=$info['sex'];//性别
                $data=[
                    'nickname'=>$nickname,
                    'sex'=>$sex,
                    'head_img'=>$headimgurl,
                    'openid'=>$openid,
                    'group_id'=>1
                ];
                $map=[
                    'openid'=>$openid
                 ];
               $member=new MemberModel();
               $count=$member->getAllCount($map);
               if($count>0){
                   
                   $member->editMember($data);
               }else{
                   $member->insertMember($data);
                   
                   
               }
               Cookie::set('openid',$openid,3600);
                
            }else{
                $this->get_code();
                exit();
            }
           
          
            
        }
    
      //}
    }
    
    private function get_code() {
            $weixin = new userinfo();
            $redirect_url = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
            $jumpurl = $weixin->oauth2_authorize($redirect_url, "snsapi_userinfo", "123");
            Header("Location: $jumpurl");
            exit();
    }
}