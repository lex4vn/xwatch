<?php 
	$id = rand(1,9)+rand();
?>
<?php if( $show_title ) { ?>
<div class="widget-heading box-heading"><?php echo $heading_title?></div>
<?php } ?>
<div class="widget-gallery-list <?php echo $addition_cls; ?>">
		<div class="carousel-inner" id="gallery<?php echo $id;?>">
			<?php foreach ($thumbnailurl as $k=>$img) { ?>
				<div class="item <?php if($k==0) {?>active<?php } ?> products-block">
					<img src="<?php echo $img; ?>" alt="img"/>
				</div>
			<?php } ?>
			<?php if( count($thumbnailurl) > $itemsperpage ) { ?>
			<ul class="carousel-indicators carousel-indicators-v2">
				<?php foreach ($thumbnailurl as $k=>$img) { ?>
                	<li class="<?php if($k==0) {?>active<?php } ?>"><a href="" data-target="#gallery<?php echo $id;?>" data-slide-to="<?php echo $k; ?>"></a></li>
                <?php } ?>
            </ul>
			<?php } ?>
		</div>	
</div>


