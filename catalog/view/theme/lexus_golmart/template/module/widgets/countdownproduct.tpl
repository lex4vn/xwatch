<?php
	$themeConfig = (array)$this->config->get('themecontrol');
	$listingConfig = array(
		'category_pzoom'        => 1,
		'quickview'             => 0,
		'show_swap_image'       => 0,
		'product_layout'		=> 'default',
		'enable_paneltool'	    => 0
	);
	$listingConfig = array_merge($listingConfig, $themeConfig );
	$categoryPzoom = $listingConfig['category_pzoom'];
	$quickview     = $listingConfig['quickview'];
	$swapimg       = $listingConfig['show_swap_image'];
	$categoryPzoom = isset($themeConfig['category_pzoom']) ? $themeConfig['category_pzoom']:0; 

	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	$button_cart = $this->language->get('button_cart');
	$id = rand(1,9)+rand();
?>
<?php $objlang = $this->registry->get('language');  ?>
<div class="widget bg-carousel flashsale">

		
	<div class="list box-products slide" id="product_list<?php echo $id;?>">
		<div class="panel panel-v3 <?php echo $addition_cls;?>">
			<div class="panel-heading clearfix">
				<div class="col-lg-8 col-md-7 col-sm-5 col-xs-12">
					<h4 class="panel-title"><?php echo $heading_title?></h4>
				</div>
				<div class="col-lg-4 col-md-5 col-sm-7 col-xs-12">
				<h4 class="font-size-18 text-heading"><?php echo htmlspecialchars_decode( $html ); ?></h4>
				<div id="item_countdown" class="item-countdown pull-left"></div>					
				</div>					
			</div>				
			<div class="product-grid block-content">
				<div class="item  products-block col-nopadding">
					<div class="row products-row">
					<?php foreach ($products as  $k => $product ) {   ?>
							<div class="col-md-3 col-lg-3 product-col border">
								<?php require( $productLayout );  ?>
							</div>
					<?php } ?>
					</div>
				</div>
			</div>	
		</div>
	</div>	
</div>
<script type="text/javascript">
  jQuery(document).ready(function($){
    $("#item_countdown").lofCountDown({
      formatStyle:2,
      TargetDate:"<?php echo date('m/d/Y G:i:s', strtotime($end_date)); ?>",
      DisplayFormat:"<ul class='list-inline'><li>%%D%% <span><?php echo $objlang->get("text_days");?></span></li><li> %%H%% <span><?php echo $objlang->get("text_hours");?></span></li><li> %%M%% <span><?php echo $objlang->get("text_minutes");?></span></li><li> %%S%% <span><?php echo $objlang->get("text_seconds");?></span></li></ul>",
      FinishMessage: "<?php echo $objlang->get('text_finish');?>"
    });
  });
</script>