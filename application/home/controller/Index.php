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
    
    public function index8(){

    }
    
    public function index9(){
      
    }
}
