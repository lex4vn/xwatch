<?php 
/******************************************************
 *  Leo Opencart Theme Framework for Opencart 1.5.x
 *
 * @package   leotempcp
 * @version   3.0
 * @author    http://www.leotheme.com
 * @copyright Copyright (C) October 2013 LeoThemes.com <@emai:leotheme@gmail.com>
 *               <info@leotheme.com>.All rights reserved.
 * @license   GNU General Public License version 2
 * ******************************************************/
class PtsWidgetProduct_scroll extends PtsWidgetPageBuilder {

		public $name = 'product_scroll';
		public $group = 'product';
		
		public static function getWidgetInfo(){
			return array('label' =>  ('Product Scroll'), 'explain' => 'Product List With Option: Newest, Bestseller, Special, Featured', 'group' => 'product'  );
		}


		public function renderForm( $args, $data ){
			$helper = $this->getFormHelper();
			$key = time();	
			$key1 = time()+12;	
			$key2 = time()+24;	
			$key3 = time()+36;	
			$types = array();	
		 	$types[] = array(
		 		'value' => 'newest',
		 		'text'  => $this->l('Products Newest')
		 	);
		 	$types[] = array(
		 		'value' => 'bestseller',
		 		'text'  => $this->l('Products Bestseller')
		 	);
 
		 	$types[] = array(
		 		'value' => 'special',
		 		'text'  => $this->l('Products Special')
		 	);

		 	$types[] = array(
		 		'value' => 'featured',
		 		'text'  => $this->l('Products Featured')
		 	);

			$this->fields_form[1]['form'] = array(
	            'legend' => array(
	                'title' => $this->l('Widget Form.'),
	            ),
	            'input' => array(
 					array(
	                    'type'  => 'text',
	                    'label' => $this->l('Id Item'),
	                    'name'  => 'id_item',
	                    'default'=> 'productscroll_'.$key ,
	                ),			
                	array(
	                    'type'  => 'text',
	                    'label' => $this->l('Icon'),
	                    'name'  => 'icon',
	                    'class' => 'imageupload',
	                    'default'=> '',
	                    'id'	 => 'icon_'.$key1,
	                    'desc'	=> 'Put image folder in the image folder ROOT_SHOP_DIR/image/'
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner 1 size'),
	                    'name'  => 'icon_size',
	                    'class' => 'image',
	                    'default'=> '50x50',
	                    'id'	 => 'icon_'.$key	,
	                    'desc'	=> "Enter image size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height). Leave empty to use 'thumbnail' size."
	                ),				
                	array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner 1'),
	                    'name'  => 'banner1',
	                    'class' => 'imageupload1',
	                    'default'=> '',
	                    'id'	 => 'banner1_'.$key2,
	                    'desc'	=> 'Put image folder in the image folder ROOT_SHOP_DIR/image/'
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner 1 size'),
	                    'name'  => 'banner1_size',
	                    'class' => 'image',
	                    'default'=> '200x200',
	                    'id'	 => 'banner1_'.$key	,
	                    'desc'	=> "Enter image size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height). Leave empty to use 'thumbnail' size."
	                ),	 
                	array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner 2'),
	                    'name'  => 'banner2',
	                    'class' => 'imageupload2',
	                    'default'=> '',
	                    'id'	 => 'banner2_'.$key3,
	                    'desc'	=> 'Put image folder in the image folder ROOT_SHOP_DIR/image/'
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Banner 2 size'),
	                    'name'  => 'banner2_size',
	                    'class' => 'image',
	                    'default'=> '200x200',
	                    'id'	 => 'banner2_'.$key	,
	                    'desc'	=> "Enter image size. Example: thumbnail, medium, large, full or other sizes defined by current theme. Alternatively enter image size in pixels: 200x100 (Width x Height). Leave empty to use 'thumbnail' size."
	                ),	 					
 					array(
	                    'type'  => 'text',
	                    'label' => $this->l('Limit'),
	                    'name'  => 'limit',
	                    'default'=> 6,
	                ),

 					array(
	                    'type'  => 'text',
	                    'label' => $this->l('Column'),
	                    'name'  => 'column',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Show In Carousel with N Column in each page')
	                ),
	                array(
	                    'type'  => 'text',
	                    'label' => $this->l('Items Per Page'),
	                    'name'  => 'itemsperpage',
	                    'default'=> 4,
	                    'desc'	=> $this->l('Please enter icon from font-awesome')
	                ),
	     
	      			array(
	                    'type'  => 'text',
	                    'label' => $this->l('width'),
	                    'name'  => 'width',
	                    'default'=> 200,
	                ),

 					array(
	                    'type'  => 'text',
	                    'label' => $this->l('height'),
	                    'name'  => 'height',
	                    'default'=> 200,
	                ),
	                array(
	                    'type' 	  => 'select',
	                    'label'   => $this->l( 'Products List Type' ),
	                    'name' 	  => 'list_type',
	                    'options' => array(  'query' => $types ,
	                    'id' 	  => 'value',
	                    'name' 	  => 'text' ),
	                    'default' => "newest",
	                    'desc'    => $this->l( 'Select a Product List Type' )
	                ),
					array(
						'type' => 'text',
						'label' => $this->l('Categories'),
						'name' => 'catids',
						'desc' => '',
						'default' => '20,18,25',
					),
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
			
			$this->load->model('tool/image');
			$this->model_tool_image->resize('no_image.png', 100, 100);
			$placeholder  = $this->model_tool_image->resize('no_image.png', 100, 100);
		//	d( $this->token );
			$string = ' 


		 
					 <script type="text/javascript">
						$(".imageupload").WPO_Gallery({key:"'.$key1.'",gallery:false,placehold:"'.$placeholder.'",baseurl:"'.HTTP_CATALOG . 'image/'.'" } );
						$(".imageupload1").WPO_Gallery({key:"'.$key2.'",gallery:false,placehold:"'.$placeholder.'",baseurl:"'.HTTP_CATALOG . 'image/'.'" } );
						$(".imageupload2").WPO_Gallery({key:"'.$key3.'",gallery:false,placehold:"'.$placeholder.'",baseurl:"'.HTTP_CATALOG . 'image/'.'" } );
					</script>
		 
			';
			return  '<div id="imageslist'.$key.'">'.$helper->generateForm( $this->fields_form ) .$string."</div>" ;

		}

		private function getProducts( $results, $setting ){

			$products = array();

			$themeConfig = $this->config->get('themecontrol');
			 
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
					// Image Attribute for product
					 
				} else {
					$image = false;
				}
							
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}
				
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				
	 			
				
				$products[] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'description'=> (html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')),
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
					'thumb2'     => isset($thumb2)?$thumb2:'',
				);
			}
			return $products;
		}


		private function getFeatured($option = array()){
			$products = explode(',', $this->config->get('featured_product'));
			$return = array();
			if(!empty($products)){
				$limit = (isset($option['limit']) && !empty($option['limit']))?$option['limit']: 5;
				$products = array_slice($products, 0, (int)$limit);
				foreach ($products as $product_id) {
					$product_info = $this->model_catalog_product->getProduct($product_id);
					$return[] = $product_info;
				}
			}
			return $return;
		}

		public function renderContent( $args, $setting ){ 


			$this->load->model('catalog/product');
			$this->load->model('catalog/category'); 
			$this->load->model('tool/image');
			$this->language->load('module/pavproducttabs');
			$t = array(
				'list_type'=> '',
				'limit' => 8,
				'enable_special' => '1',
				'enable_bestseller' => '1',
				'enable_featured' => '0',
				'enable_newest' => '1',
				'mostviewed'    => 1,
				'itemsperpage'	=> 4,
				'column'		=> 4,
				'icon_size'			=> '',
				'banner1_size'			=> '',
				'banner2_size'			=> '',
				'imagefile'		=> '',
				'width'=>'200',
				'height' =>'200',
				'catids' 		=> '20,18,25',
			);
			
			$products = array();
			$setting = array_merge( $t, $setting );
			
			$catids = explode(",", $setting['catids']);
			$categories = array();
			
			foreach ($catids as $catid) {
				$category = $this->model_catalog_category->getCategory($catid);
				if(isset($category['category_id'])) {
					$categories[$catid] = array(
						'category_id' => $category['category_id'],
						'name'        => $category['name'],
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
					);
				}
			}
			
			$setting['categories_list'] = $categories;
			
			$data = array(
				'sort'  => 'p.date_added',
				'order' => 'DESC',
				'start' => 0,
				'limit' => $setting['limit']
			);

		 
			$setting['cols'] = $setting['column'];
			
			switch ( $setting['list_type'] ) {
				case 'bestseller':
			 		$products = $this->getProducts( $this->model_catalog_product->getBestSellerProducts( $data['limit'] ), $setting );
					break;
				case 'special':
	 				$products = $this->getProducts( $this->model_catalog_product->getProductSpecials( $data ), $setting );
					break;
				case 'featured':
	 				$products = $this->getProducts( $this->getFeatured($data), $setting );	
					break;
				case 'mostviewed':
					$data['sort'] = 'p.viewed';
					$products = $this->getProducts( $this->model_catalog_product->getProducts( $data ), $setting );
					break;
				default:
					$products = $this->getProducts( $this->model_catalog_product->getProducts( $data ), $setting );
					break;
			}

			$languageID = $this->config->get('config_language_id');
			$setting['heading_title'] = isset($setting['widget_title_'.$languageID])?$setting['widget_title_'.$languageID]:'';
	 		 
		
			$setting['products'] = $products; 

			
			$url = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? HTTPS_SERVER : HTTP_SERVER;
	        $url .= 'image/'; 

			$setting = array_merge( $t, $setting );		

			$icon_size = explode( "x", $setting['icon_size'] );	
			$banner1_size = explode( "x", $setting['banner1_size'] );	
			$banner2_size = explode( "x", $setting['banner2_size'] );		
			$setting['img_icon'] = $url.$setting['icon'];
			$setting['img_banner1'] = $url.$setting['banner1'];
			$setting['img_banner2'] = $url.$setting['banner2'];
			$this->load->model('tool/image'); 
			if( isset($icon_size) && count($icon_size) == 2 ){			 	
				$setting['img_icon']= $this->model_tool_image->resize( $setting['icon'], (int)$icon_size[0], (int)$icon_size[1],'w');
			}
			if( isset($banner1_size) && count($banner1_size) == 2 ){
				$setting['img_banner1']= $this->model_tool_image->resize( $setting['banner1'], (int)$banner1_size[0], (int)$banner1_size[1],'w');
			}
			if( isset($banner2_size) && count($banner2_size) == 2 ){
				$setting['img_banner2']= $this->model_tool_image->resize( $setting['banner2'], (int)$banner2_size[0], (int)$banner2_size[1],'w');
			}			

			$output = array('type'=>'products','data' => $setting );
 
			return $output;
		}
	}
?>