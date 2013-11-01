<?php
class BaseAction extends Action{
	public function _initialize(){
		if(!authcheck(MODULE_NAME.'_'.ACTION_NAME,$_SESSION['user']['id'])){
			sessionTip('请登录！',4);
			$this->redirect('/Index/login');
		}
	}
	/**
	 * 删除指定数据
	 * @param $tbname 表名
	 * @param $id 数据id
	 * @param $dc 是否删除所有子项 默认false
	 */
	protected function delete($tbname,$id,$dc=false){
		if($id>0){
			$count = M($tbname)->delete($id);
			if($count>0){
				!$dc||self::deleteChild($tbname,$id);
				sessionTip('删除成功！');
				return true;
			}else{
				sessionTip('删除失败！',3);
			}
		}else{
			sessionTip('错误操作，无法删除！',2);
		}
		return false;
	}
	/**
	 * 递归删除所有子项
	 * @param $tbname 表名
	 * @param $pid 数据id
	 */
	private function deleteChild($tbname,$pid){
		$roles = M($tbname)->where(array('pid'=>$pid))->select();
		foreach($roles as $r){
			M($tbname)->where(array('pid'=>$pid))->delete();
			self::deleteChild($r['id']);
		}
	}
}
?>