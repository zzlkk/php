<?php
class AGroupAction extends BaseAction{
	public function index(){
		$this->agroup = unlimitLevel(M('auth_group')->order('sort')->select());
		$this->display();
	}
	public function edit(){
		$id=I('id',0,'intval');
		if($id>0){
			$this->ajaxReturn(M('auth_group')->find($id));
		}else{
			$this->ajaxReturn(null);
		}
	}
	public function save(){
		$id=I('id',0,'intval');
		$pid=I('pid',-1,'intval');
		$title=I('title','');
		$rules=I('rules','');
		$sort=I('sort',-1,'intval');
		$status=I('status',false,'boolean');

		$data = array();
		$pid<0||$data['pid']=$pid;
		strlen($title)<1||$data['title']=$title;
		strlen($rules)<1||$data['rules']=$rules;
		$sort<0||$data['sort']=$sort;
		!isset($_REQUEST['status'])||$data['status']=$status;

		if($id>0&&count($data)>0){//update
			$num = M('auth_group')->where('id='.$id)->save($data);
			if($num>0){
				sessionTip('更新成功！');
			}else{
				sessionTip('更新失败！',3);
			}
		}elseif(strlen($title)>0){//add
			$newid = M('auth_group')->add($data);
			if($newid>0){
				sessionTip('添加成功！');
			}else{
				sessionTip('添加失败！',3);
			}
		}else{//error
			sessionTip('操作失败，数据无变更！',2);
		}
		$this->redirect('index');
	}
	public function delete(){
		$id=I('id',0,'intval');
		parent::delete('auth_group',$id,true);
		$this->redirect('index');
	}
}
?>