<?php if( $banners ) { ?>
<?php if( isset($widget_name)){
?>
<span class="menu-title"><?php echo $widget_name;?></span>
<?php
}?>
<div class="widget-banner">
	<div class="widget-inner clearfix">
		  <?php foreach ($banners as $banner) { ?>
		  <?php if ($banner['link']) { ?>
		  <div class="w-banner col-lg-4 col-md-4 col-sm-4 col-xs-4"><a href="<?php echo $banner['link']; ?>"><img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></div>
		  <?php } else { ?>
		  <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><img class="img-responsive" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></div>
		  <?php } ?>
		  <?php } ?>
	</div>
</div>
<?php } ?>