<?php 
class ModelModuleBuyNow extends Model {

  	public function install() {
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=1 WHERE `name` LIKE'%BuyNow by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	} 
  
  	public function uninstall() {
		$this->db->query("UPDATE `" . DB_PREFIX . "modification` SET status=0 WHERE `name` LIKE'%BuyNow by iSenseLabs%'");
		$modifications = $this->load->controller('extension/modification/refresh');
  	}
	
  }
?>