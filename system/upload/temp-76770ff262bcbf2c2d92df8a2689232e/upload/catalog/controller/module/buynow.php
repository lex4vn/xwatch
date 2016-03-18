<?php 
class ControllerModuleBuyNow extends Controller  {

	public function getproducts(){
		$this->load->model('setting/setting');
		$this->load->language('module/buynow');
        $languageVariables= array(
            'heading_title',
            'buy_now'
       	);
        foreach ($languageVariables as $variable) {
            $data[$variable] = $this->language->get($variable);
        }
		$BuyNow = $this->model_setting_setting->getSetting('BuyNow', $this->config->get('store_id'));
		
		$data['BuyNow'] = false;
		
		$json = array();
		if (isset($BuyNow) && isset($BuyNow['BuyNow']) && ($BuyNow['BuyNow']['Enabled'] == 'yes')) {
			if(!isset($BuyNow['BuyNow']['ButtonName'][$this->config->get('config_language')])){
				$json['button'] = $data['buy_now'];
			} else {
				$json['button'] = $BuyNow['BuyNow']['ButtonName'][$this->config->get('config_language')];
			}
			$json['enabled'] = true;
			if ( $BuyNow['BuyNow']['ShowWhere']=='specific_products' ) {
				if ( isset($BuyNow['BuyNow']['Products']) ) {
					$json['products'] = $BuyNow['BuyNow']['Products'];	
				}
			} else if ( $BuyNow['BuyNow']['ShowWhere']=='all_products' )
				$json['products'] = 'all';
		} else {
			$json['enabled'] = false;
		}

		$this->response->setOutput(json_encode($json)); 
    }
}
?>