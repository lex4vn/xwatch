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

	$span = 12/$cols;

	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';	
	if( !is_file($productLayout) ){
		$listingConfig['product_layout'] = 'default';
	}
	$productLayout = DIR_TEMPLATE.$this->config->get('config_template').'/template/common/product/'.$listingConfig['product_layout'].'.tpl';
	$button_cart = $this->language->get('button_cart');
	$id = rand(1,9)+rand();
	$columns_count  = 1;
?>

<div class="widget bg-white product-scroll col-nopadding group" <?php if(isset($id_item) && $id_item) { echo 'id="'.$id_item.'"';} ?>>
	<div class="row">
		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12 style-left">
			<div class="panel <?php echo $addition_cls;?> panel-v3">
				<div class="panel-heading">
					<?php if( $show_title ) { ?>
					<h4 class="panel-title"><?php echo $heading_title?></h4>
					<?php } ?>				
				</div>
				<div class="panel-body">
					<?php if( $categories_list ) { ?>
					<ul class="list">
						<?php foreach ($categories_list as $category){ ?>
						<li><a href="<?php echo $category['href']; ?>"><span class="title"><?php echo $category['name']; ?></span></a></li>
						<?php } ?>
					</ul>
					<?php } ?>
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-md-10 col-sm-9 hidden-xs">
			<div class="list box-products owl-carousel-play" id="product_list<?php echo $id;?>" data-ride="owlcarousel">
				<?php if( count($products) > $itemsperpage ) { ?>
            		<div class="carousel-controls-v1">
						<a class="carousel-control left radius-x carousel-sm" href="#product_list<?php echo $id;?>"   data-slide="prev">
							<i class="fa fa-angle-left"></i>
						</a>
						<a class="carousel-control right radius-x carousel-sm" href="#product_list<?php echo $id;?>"  data-slide="next">
							<i class="fa fa-angle-right"></i>
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
								<div class="col-lg-<?php echo $span;?> col-md-<?php echo $span;?> col-sm-6 col-xs-12 <?php if($i%$cols == 0) { echo "last";} ?> product-col border">
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
			<?php if ( isset($img_banner1) && isset($img_banner2))  { ?>
			<div class="col-lg-12 col-md-12">
				 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 effect-v8">					
					
					<a href="<?php echo $img_banner1; ?>" title="<?php echo $this->language->get('Large Image');?>"><img class="img-responsive" alt=" " src="<?php echo $img_banner1; ?>"/><span class="icon icon-expand"></span></a>
							  
				 </div>
				 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 effect-v8">
										
					<a href="<?php echo $img_banner2; ?>" title="<?php echo $this->language->get('Large Image');?>"><img class="img-responsive" alt=" " src="<?php echo $img_banner2; ?>"/><span class="icon icon-expand"></span></a>							  
				 </div>
			</div>
			<?php }elseif(isset($img_banner1) || isset($img_banner2)){?>	
				<?php if (isset($img_banner1))  { ?>
					<div class="col-lg-12 col-md-12 effect-v8">
											
						<a href="<?php echo $img_banner1; ?>" title="<?php echo $this->language->get('Large Image');?>"><img class="img-responsive" alt=" " src="<?php echo $img_banner1; ?>"/>	<span class="icon icon-expand"></span></a>
					</div>
			 	<?php } ?>			
				<?php if (isset($img_banner2))  { ?>
					 <div class="col-lg-12 col-md-12 effect-v8">
						
						
						<a href="<?php echo $img_banner2; ?>" title="<?php echo $this->language->get('Large Image');?>"><img class="img-responsive" alt=" " src="<?php echo $img_banner2; ?>"/><span class="icon icon-expand"></span></a>
								  
					 </div>
			 	<?php } ?>
			<?php } ?>
		
		</div>
		
		<?php if ( isset($img_icon) )  { ?>
		 <div class="image-icon-item">
		 <img class="img-responsive" alt=" " src="<?php echo $img_icon; ?>"/>
		 	<span><?php echo $heading_title?></span>
		 </div>
		<?php } ?>
	</div>
		
		
</div>


