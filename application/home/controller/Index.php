<?php
namespace app\home\controller;
use app\home\model\IndexModel;
use think\Db;
use think\Cookie;
use app\admin\model\MemberModel;
use think\Request;
use photo\toutu;
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
            '1'=>
              [
                  'type'=>1,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg01.jpg'
                  ],
              '2'=>
              [
                  'type'=>1,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg07.jpg'
                  ],
              '3'=>
              [
                  'type'=>1,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg05.jpg'
                  ],
              '4'=>
              [
                  'type'=>1,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg06.jpg'
                  ],
              '5'=>
              [
                  'type'=>3,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg03.jpg'
                  ],
              '6'=>
              [
                  'type'=>2,
                  'url'=>$viewpath['__UPLOAD__'].'/img/bg04.jpg'
                  ]
          
              
              
          ];
          if($arr[$id]['url']!=''){
             Cookie::set('bgimg',$arr[$id]['url'],3600);
             Cookie::set('bgtype',$arr[$id]['type'],3600);
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
       
        if(cookie::has('imgurl')&&cookie::has('bgimg')&&cookie::has('bgtype')){
            $this->assign('imgurl',cookie::get('imgurl')); //前置图片
            $this->assign('bgtype',cookie::get('bgtype')); //前置图片
            $this->assign('bgimg',cookie::get('bgimg'));//背景图片 
        }else{
            $this->redirect(url('Index/index4'));
            exit;
        }
       
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

//    public function index7(){
//      
//        //查询该用户的专属码
//        $map=[
//          'openid'=>Cookie::get('openid')
//           ];
//          $member=new MemberModel();
//            $user=$member->where($map)->find();
//            if($user['unicount']){
//                $this->assign('unicount',$user['unicount']);
//            }else{
//                 header("Location:".url('Index/index'));
//                 exit;
//            }
//      return $this->fetch();
//    }
       public function makeimg() {
        if(Request::instance()->isAjax()){
            
        $param=Request::instance()->param();
        $photo=new toutu();
        $viewpath= config('view_replace_str');
        
        $data=[
            'bgimg'=>[
                'url'=>ROOT_PATH.'public'.$param['bgurl'],
                'width'=>$param['bgwidth'],
                'height'=>$param['bgheight']
            ],
            'img'=>[
               'url'=>ROOT_PATH.'public'.$param['imgurl'],
               'width'=>$param['width'],
               'height'=>$param['height'],
                'x'=>$param['x'],
                'y'=>$param['y']
            ]
        ];
        $photourl=$photo->makeimg($data);
        //生成专属码
         if(Cookie::has('openid')){
            
        
         $member=new MemberModel();
        
         $where=[
             'openid'=> cookie::get('openid')
                 ];
         if($photourl){
            
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
             'photo'=>$photourl,
              'unicount'=>$num
            ]; 
          }else{
              
              $data=[
             'photo'=>$photourl,
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
    }
        public function index9(){
      
        //查询该用户的专属码和专属桌面
        $map=[
          'openid'=>Cookie::get('openid')
           ];
          $member=new MemberModel();
            $user=$member->where($map)->find();
            if($user['unicount']){
                $this->assign('unicount',$user['unicount']);
                $this->assign('destopimg',$user['photo']);
            }else{
                 header("Location:".url('Index/index'));
                 exit;
            }
      return $this->fetch();
    }
}
