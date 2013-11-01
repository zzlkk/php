<?php
class FinanceAction extends BaseAction{
	public function index(){
		$size=I('size',10,'intval');
		import('ORG.Util.Page');
		$model=M('finance');
		$finance = $model->field("price")->join(array('LEFT JOIN auth_group_access a ON a.uid=finance.uid','INNER JOIN auth_group_access b ON a.group_id=b.group_id'))->where('b.uid='.$_SESSION['user']['id'])->select();
		$Page = new Page(count($finance),$size);
		$this->finances = $model->join(array('LEFT JOIN auth_group_access a ON a.uid=finance.uid','INNER JOIN auth_group_access b ON a.group_id=b.group_id'))->where('b.uid='.$_SESSION['user']['id'])->order('id desc')->limit($Page->firstRow,$Page->listRows)->select();
		$in=0;
		$out=0;
		foreach($finance as $f){
			$f['price']>0?$in+=$f['price']:$out+=$f['price'];
		}
		$this->in=$in;
		$this->out=$out;
		$this->pager = $Page->show();
		$this->display();
	}
	public function save(){
		$id=I('id',0,'intval');
		$title=I('title','');
		$price=I('price',0,'floatval');
		$remark=I('remark','');
		$time=I('time',date('Y-m-d'));

		$data = array();
		(strlen($title)<1&&strlen($remark)<1)||$data['title']=$title;
		strlen($price)<1||$data['price']=$price;
		(strlen($remark)<1&&strlen($title)<1)||$data['remark']=$remark;
		strlen($time)<1||$data['time']=$time;
		if($id>0&&count($data)>0){//update
			$num = M('finance')->where(array('id'=>$id,'uid'=>$_SESSION['user']['id']))->save($data);
			if($num>0){
				sessionTip('更新成功！');
			}else{
				sessionTip('更新失败！',4);
			}
		}elseif(strlen($title)>0||strlen($remark)>0){//add
			$data['uid']=$_SESSION['user']['id'];
			$newid = M('finance')->add($data);
			if($newid>0){
				sessionTip('添加成功！');
			}else{
				sessionTip('添加失败！',4);
			}
		}else{//error
			sessionTip('操作失败，数据无变更！',3);
		}
		$this->redirect('index');
	}
	public function delete(){
		$id=I('id',0,'intval');
		$count = M('finance')->where(array('id'=>$id,'uid'=>$_SESSION['user']['id']))->delete();
		if($count>0){
			sessionTip('删除成功！',2);
		}else{
			sessionTip('删除失败！',3);
		}
		$this->redirect('index');
	}
}
?>