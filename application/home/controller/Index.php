<?php
namespace app\home\controller;
use app\home\model\IndexModel;
use think\Db;

class Index extends Base
{

    public function index(){

      return $this->fetch();
    }

}
