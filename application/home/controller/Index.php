<?php
namespace app\home\controller;
use app\home\model\IndexModel;
use think\Db;
use think\Cookie;
use app\admin\model\MemberModel;
class Index extends Base
{
	public function index(){
           
      return $this->fetch();
    }

	public function index2(){

      return $this->fetch();
    }

    public function index3(){

      return $this->fetch();
    }

    public function index4(){

      return $this->fetch();
    }

    public function cropper(){
        if(isset($_GET['id'])){
          $id=  $_GET['id'];
        }else{
            $id= Cookie::get('iddata');
        }
       
        if($id){
            Cookie::set('iddata',$id);
            $viewpath= config('view_replace_str');
          $arr=[
            '1'=>$viewpath['__UPLOAD__'].'/img/bg01.jpg',
            '2'=>$viewpath['__UPLOAD__'].'/img/bg07.jpg',
            '3'=>$viewpath['__UPLOAD__'].'/img/bg05.jpg',
            '4'=>$viewpath['__UPLOAD__'].'/img/bg06.jpg',
            '5'=>$viewpath['__UPLOAD__'].'/img/bg03.jpg',
            '6'=>$viewpath['__UPLOAD__'].'/img/bg04.jpg',
              
              
          ];
          if($arr[$id]!=''){
             Cookie::set('bgimg',$arr[$id],3600);
             
          }else{
              echo '非法操作';
              exit;
          }
          
       
         
        }else{

            if(!Cookie::has('bgimg')){
                $this->redirect(url('Index/index4'));
                exit;
            }
        }
     return $this->fetch();
      
    }

    public function index8(){
       
        if(cookie::has('imgurl')&&cookie::has('bgimg')){
            $this->assign('imgurl',cookie::get('imgurl')); //前置图片
            $this->assign('bgimg',cookie::get('bgimg'));//背景图片 
        }else{
            $this->redirect(url('Index/index4'));
            exit;
        }
       
      return $this->fetch();
    }
    
    public function index9(){
      return $this->fetch();
    }

    public function index5(){

      return $this->fetch();
    }

    public function index5s(){

      return $this->fetch();
    }

    public function index6(){
      
      $this->assign('imgurl',cookie::get('imgurl'));
      return $this->fetch();
    }

    public function index7(){
      
        //查询该用户的专属码
        $map=[
          'openid'=>Cookie::get('openid')
           ];
          $member=new MemberModel();
            $user=$member->where($map)->find();
            if($user['unicount']){
                $this->assign('unicount',$user['unicount']);
            }else{
                 header("Location:".url('Index/index'));
                 exit;
            }
      return $this->fetch();
    }
}
