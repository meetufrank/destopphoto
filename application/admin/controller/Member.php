<?php

namespace app\admin\controller;
use app\admin\model\MemberModel;
use app\admin\model\MemberGroupModel;
use think\Db;
use think\Request;
use excel\excels;
class Member extends Base
{
    //*********************************************会员组*********************************************//
    /**
     * [group 会员组]
     * @author [田建龙] [864491238@qq.com]
     */
    public function group(){

        $key = input('key');
        $map = [];
        if($key&&$key!==""){
            $map['group_name'] = ['like',"%" . $key . "%"];          
        }      
        $group = new MemberGroupModel(); 
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config('list_rows');
        $count = $group->getAllCount($map);         //获取总条数
        $allpage = intval(ceil($count / $limits));  //计算总页面      
        $lists = $group->getAll($map, $Nowpage, $limits);  
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('val', $key);
        if(input('get.page')){
            return json($lists);
        }
        return $this->fetch();
    }
 

    /**
     * [add_group 添加会员组]
     * @author [田建龙] [864491238@qq.com]
     */
    public function add_group()
    {
        if(request()->isAjax()){
            $param = input('post.');
            $group = new MemberGroupModel();
            $flag = $group->insertGroup($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        return $this->fetch();
    }


    /**
     * [edit_group 编辑会员组]
     * @author [田建龙] [864491238@qq.com]
     */
    public function edit_group()
    {
        $group = new MemberGroupModel();
        if(request()->isPost()){           
            $param = input('post.');
            $flag = $group->editGroup($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }
        $id = input('param.id');
        $this->assign('group',$group->getOne($id));
        return $this->fetch();
    }


    /**
     * [del_group 删除会员组]
     * @author [田建龙] [864491238@qq.com]
     */
    public function del_group()
    {
        $id = input('param.id');
        $group = new MemberGroupModel();
        $flag = $group->delGroup($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }

    /**
     * [group_status 会员组状态]
     * @author [田建龙] [864491238@qq.com]
     */
    public function group_status()
    {
        $id=input('param.id');
        $status = Db::name('member_group')->where(array('id'=>$id))->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = Db::name('member_group')->where(array('id'=>$id))->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }
        else
        {
            $flag = Db::name('member_group')->where(array('id'=>$id))->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }   
    } 


    //*********************************************会员列表*********************************************//
    /**
     * 会员列表
     * @author [田建龙] [864491238@qq.com]
     */
    public function index(){
     
        $key = input('key');
        $map['closed'] = 0;//0未删除，1已删除
        if($key&&$key!=="")
        {
            $map['unicount|nickname'] = ['like',"%" . $key . "%"];          
        }
        $member = new MemberModel();       
        $Nowpage = input('get.page') ? input('get.page'):1;
        $limits = config('list_rows');// 获取总条数
        $count = $member->getAllCount($map);//计算总页面
        $allpage = intval(ceil($count / $limits));       
        $lists = $member->getMemberByWhere($map, $Nowpage, $limits);   
        $this->assign('Nowpage', $Nowpage); //当前页
        $this->assign('allpage', $allpage); //总页数 
        $this->assign('val', $key);
        if(input('get.page'))
        {
            return json($lists);
        }
        
        return $this->fetch();
    }


    /**
     * 添加会员
     * @author [田建龙] [864491238@qq.com]
     */
    public function add_member()
    {
        if(request()->isAjax()){

            $param = input('post.');
            $param['password'] = md5(md5($param['password']) . config('auth_key'));
            $member = new MemberModel();
            $flag = $member->insertMember($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $group = new MemberGroupModel();
        $this->assign('group',$group->getGroup());
        return $this->fetch();
    }


    /**
     * 编辑会员
     * @author [田建龙] [864491238@qq.com]
     */
    public function edit_member()
    {
        $member = new MemberModel();
        if(request()->isAjax()){
            $param = input('post.');
            if(empty($param['password'])){
                unset($param['password']);
            }else{
                $param['password'] = md5(md5($param['password']) . config('auth_key'));
            }
            $flag = $member->editMember($param);
            return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
        }

        $id = input('param.id');
        $group = new MemberGroupModel();
        $this->assign([
            'member' => $member->getOneMember($id),
            'group' => $group->getGroup()
        ]);
        return $this->fetch();
    }


    /**
     * 删除会员
     * @author [田建龙] [864491238@qq.com]
     */
    public function del_member()
    {
        $id = input('param.id');
        $member = new MemberModel();
        $flag = $member->delMember($id);
        return json(['code' => $flag['code'], 'data' => $flag['data'], 'msg' => $flag['msg']]);
    }



    /**
     * 会员状态
     * @author [田建龙] [864491238@qq.com]
     */
    public function member_status()
    {
        $id = input('param.id');
        $status = Db::name('member')->where('id',$id)->value('status');//判断当前状态情况
        if($status==1)
        {
            $flag = Db::name('member')->where('id',$id)->setField(['status'=>0]);
            return json(['code' => 1, 'data' => $flag['data'], 'msg' => '已禁止']);
        }
        else
        {
            $flag = Db::name('member')->where('id',$id)->setField(['status'=>1]);
            return json(['code' => 0, 'data' => $flag['data'], 'msg' => '已开启']);
        }
    
    }
    
    
    /*
     * 导出excel表格
     */
        Public function exportUser(){
        
         set_time_limit(0);
         $where=[
             'unicount'=>['gt',0]
         ];
        $userlist=Db::name('member')->where($where)->select();
    	 
    		error_reporting(E_ALL);
    		date_default_timezone_set('Europe/London');
                
                $excels=new excels();
                $objPHPExcel=$excels->phpexcel();
                $excels->loaderexcel5(); //加载excel5

                
    		$title=date("Y-m-d")."专属码用户";
    		/*设置excel的属性*/
    		$objPHPExcel->getProperties()->setCreator("admin")//创建人
    		->setLastModifiedBy("admin")//最后修改人
    		->setTitle($title)//标题
    		->setSubject($title)//题目
    		->setDescription("")//描述
    		->setKeywords("用户")//关键字
    		->setCategory("result file");//种类
    		//set width
    		$objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(8);
    		$objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(30);
    		$objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(5);
    		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(10);

    		//第一行数据
    		$objPHPExcel->setActiveSheetIndex(0)
    		->setCellValue('A1', '序号')
    		->setCellValue('B1', '微信昵称')
    		->setCellValue('C1','性别')
    		->setCellValue('D1', '专属码');
    		  
                           
    		

    		foreach($userlist as $k => $v){
                    
					$k=$k+1;
    				$num=$k+1;//数据从第二行开始录入

                         //整理数据
                         $v['sex']?$v['sex']='男':$v['sex']='女'; 
                         
                  
    			$objPHPExcel->setActiveSheetIndex(0)
    			//Excel的第A列，uid是你查出数组的键值，下面以此类推
    			->setCellValue('A'.$num, $num-1)
    			->setCellValue('B'.$num, $v['nickname'])
    			->setCellValue('C'.$num, $v['sex'])
    			->setCellValue('D'.$num, $v['unicount']);
    			


    		}
                
    		$objPHPExcel->getActiveSheet()->setTitle('User');
    		$objPHPExcel->setActiveSheetIndex(0);
    		ob_end_clean();//清除缓冲区,避免乱码
    		header('Content-Type: application/vnd.ms-excel');
    		header('Content-Disposition: attachment;filename="'.$title.'.xls"');
    		header('Cache-Control: max-age=0');
    		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
    		$objWriter->save('php://output');
    		exit;

        
    }

}