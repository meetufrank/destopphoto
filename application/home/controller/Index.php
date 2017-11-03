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
    
    
    //上传生成专属码
    public function getcode() {
        
         $member=new MemberModel();
         $map=[
             'openid'=> cookie::get('openid')
                 ];
          $count=$member->where($map)->getAllCount();
          if($count){
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
                $count=$member->where($map)->getAllCount();
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
         
 
    }

}
