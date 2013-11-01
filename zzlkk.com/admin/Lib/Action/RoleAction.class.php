<?php
class RoleAction extends BaseAction{
	public function index(){
		$this->rules = unlimitLevel(M('auth_rule')->order('sort')->select());
		$this->display();
	}
	public function edit(){
		$id=I('id',0,'intval');
		if($id>0){
			$this->ajaxReturn(M('auth_rule')->find($id));
		}else{
			$this->ajaxReturn(null);
		}
	}
	public function save(){
		$id=I('id',0,'intval');
		$pid=I('pid',-1,'intval');
		$title=I('title','');
		$name=I('name','');
		$condition=I('condition',null);
		$sort=I('sort',-1,'intval');
		$status=I('status',false,'boolean');

		$data = array();
		$pid<0||$data['pid']=$pid;
		strlen($title)<1||$data['title']=$title;
		strlen($name)<1||$data['name']=$name;
		null===$condition||$data['condition']=$condition;
		$sort<0||$data['sort']=$sort;
		!isset($_REQUEST['status'])||$data['status']=$status;

		if($id>0&&count($data)>0){//update
			$num = M('auth_rule')->where('id='.$id)->save($data);
			if($num>0){
				sessionTip('更新成功！');
			}else{
				sessionTip('更新失败！',3);
			}
		}elseif(strlen($title)>0&&strlen($name)>0){//add
			$newid = M('auth_rule')->add($data);
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
		$this->ajaxReturn(parent::delete('auth_rule',$id,true));
	}
}
?>