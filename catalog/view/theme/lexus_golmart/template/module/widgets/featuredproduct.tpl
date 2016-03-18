<?php
/******************************************************
 * @package Pav Product Tabs module for Opencart 1.5.x
 * @version 1.0
 * @author http://www.pavothemes.com
 * @copyright	Copyright (C) Feb 2012 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
 * @license		GNU General Public License version 2
*******************************************************/

	$span = 12/$cols;
	$id = rand(1,9)+substr(md5($heading_title),0,3);
	$themeConfig = (array)$this->config->get('themecontrol');
	$listingConfig = array(
		'category_pzoom'                     => 1,
		'quickview'                          => 0,
		'show_swap_image'                    => 0,
		'product_layout'		=> 'default',
		'enable_paneltool'	=> 0
	);
	$listingConfig     = array_merge($listingConfig, $themeConfig );
	$categoryPzoom 	    = $listingConfig['category_pzoom'];
	$quickview          = $listingConfig['quickview'];
	$swapimg            = $listingConfig['show_swap_image'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0;

	$theme = $this->config->get('config_template');
	if( $listingConfig['enable_paneltool'] && isset($_COOKIE[$theme.'_productlayout']) && $_COOKIE[$theme.'_productlayout'] ){
		$listingConfig['product_layout'] = trim($_COOKIE[$theme.'_productlayout']);
	}
	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	
	$load = $this->registry->get("load");
	$language = $load->language("module/themecontrol");
	$quick_view = $language['quick_view'];
	$button_cart = $this->language->get('button_cart');
	$columns_count  = 1;
?>
<div class="panel col-nopadding featured-products <?php echo $addition_cls; ?>">
	<?php if( $show_title ) { ?>
	<div class="panel-heading"><h4 class="panel-title"><?php if($icon){ ?><i class="fa <?php echo $icon;?>"></i><?php }?><?php echo $heading_title?></h4></div>
	<?php } ?>
	<div class="panel-body space-padding-0">
 		<div class="box-products owl-carousel-play" id="productfeaturedcarousel<?php echo $id;?>" data-ride="owlcarousel">
		<?php if( count($products) > $itemsperpage ) { ?>
            		<div class="carousel-controls carousel-controls-v3">
				<a class="carousel-control left carousel-sm" href="#productfeaturedcarousel<?php echo $id;?>"   data-slide="prev">
							<i class="md md-arrow-back"></i>
				</a>
				<a class="carousel-control right carousel-sm" href="#productfeaturedcarousel<?php echo $id;?>"  data-slide="next">
							<i class="md md-arrow-forward"></i>
				</a>
			</div>
		<?php } ?>
				<div class="owl-carousel product-grid block-content" data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
				<?php $pages = array_chunk( $products, $itemsperpage); ?>
				<?php foreach ($pages as  $k => $tproducts ) {   ?>
				<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
					<?php foreach( $tproducts as $i => $product ) {  $i=$i+1;?>
						<?php if( $i%$cols == 1 || $cols == 1) { ?>
						<div class="row products-row <?php ;if($i == count($tproducts) - $cols +1) { echo "last";} ?>"><?php //start box-product?>
						<?php } ?>
							<div class="col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
								<?php require( $productLayout );  ?>
							</div>

						<?php if( $i%$cols == 0 || $i==count($tproducts) ) { ?>
						</div><?php //end box-product?>
						<?php } ?>
					<?php } //endforeach; ?>
				</div>
			  <?php } ?>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
	$('#productfeaturedcarousel<?php echo $id;?>').carousel({interval:<?php echo $auto_play;?>,pause:'hover'});
--></script>