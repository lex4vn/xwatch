<?php
/**
 * Pts Prestashop Theme Framework for Prestashop 1.6.x
 *
 * @package   ptspagebuilder
 * @version   5.0
 * @author    http://www.prestabrain.com
 * @copyright Copyright (C) October 2013 prestabrain.com <@emai:prestabrain@gmail.com>
 *               <info@prestabrain.com>.All rights reserved.
 * @license   GNU General Public License version 2
 */

class PtsWidgetSocial extends PtsWidgetPageBuilder {

	public $name = 'social';
	public $group = 'social';
	
	public  static function getWidgetInfo(){
		return array( 'label' => 'Social links', 'explain' => 'Get list of social icons', 'group' => 'social'  );
	}

	public function renderForm( $args, $data ){
			
		$helper = $this->getFormHelper();

		$align = array(
			array('id' => 'separator_align_center', 'name' => $this->l('Align center')),
			array('id' => 'separator_align_left', 'name' => $this->l('Align left')),
			array('id' => 'separator_align_right', 'name' => $this->l('Align right')),
		);

		$this->fields_form[1]['form'] = array(
            'legend' => array(
                'title' => $this->l('Widget Separator Form.'),
            ),

            'input' => array(
            	array(
					'type' => 'text',
					'label' => $this->l('Facebook URL'),
					'name' => 'facebook_url',
					'desc' => $this->l('Your Facebook fan page.'),
					'default' => 'http://www.facebook.com/prestashop',
				),
				array(
					'type' => 'text',
					'label' => $this->l('Twitter URL'),
					'name' => 'twitter_url',
					'desc' => $this->l('our official Twitter account.'),
					'default' => 'http://www.twitter.com/prestashop',
				),
				array(
					'type' => 'text',
					'label' => $this->l('RSS URL'),
					'name' => 'rss_url',
					'desc' => $this->l('The RSS feed of your choice (your blog, your store, etc.). '),
					'default' => 'http://www.prestashop.com/blog/en/feed/',
				),
				array(
					'type' => 'text',
					'label' => $this->l('YouTube URL '),
					'name' => 'youtube_url',
					'desc' => $this->l('Your official YouTube account. '),
					'default' => '',
				),
				array(
					'type' => 'text',
					'label' => $this->l('Google+ URL'),
					'name' => 'google_plus_url',
					'desc' => $this->l('Your official Google+ page. '),
					'default' => '',
				),
				array(
					'type' => 'text',
					'label' => $this->l('Pinterest URL'),
					'name' => 'pinterest_url',
					'desc' => $this->l('Your official Pinterest account. '),
					'default' => '',
				),
				array(
					'type' => 'text',
					'label' => $this->l('Vimeo URL'),
					'name' => 'vimeo_url',
					'desc' => $this->l('Your official Vimeo account. '),
					'default' => '',
				),
				array(
					'type' => 'text',
					'label' => $this->l('Instagram URL'),
					'name' => 'instagram_url',
					'desc' => $this->l('Your official Instagram account. '),
					'default' => '',
				)
			),		 
 				 
        
  		 	'submit' => array(
	            'title' => $this->l('Save'),
	            'class' => 'button'
   		 	)
        );


	 	$default_lang = (int)$this->config->get('config_language_id');
		
		$helper->tpl_vars = array(
                'fields_value' => $this->getConfigFieldsValues( $data  ),
                'id_language' => $default_lang
    	);  
		return  $helper->generateForm( $this->fields_form );
	}

	public function renderContent(  $args, $setting ){
		$t  = array(
			'facebook_url' => 'http://www.facebook.com/opencart',
			'twitter_url' => 'http://www.twitter.com/opencart',
			'rss_url' => 'http://www.opencart.com/blog/en/feed/',
			'youtube_url' => '',
			'google_plus_url' => '',
			'pinterest_url' => '',
			'vimeo_url' => '',
			'instagram_url' => ''
		);

		$setting    = array_merge( $t, $setting );

		$output = array('type'=>'social','data' => $setting );
		
	  	return $output;
	}
}