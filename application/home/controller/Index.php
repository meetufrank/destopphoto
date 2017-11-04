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

    public function index5(){

      return $this->fetch();
    }
    public function index6(){
      
      $this->assign('imgurl',cookie::get('imgurl'));
      return $this->fetch();
    }
    
    


}
