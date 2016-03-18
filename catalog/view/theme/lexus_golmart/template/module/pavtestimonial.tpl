<?php $objlang = $this->registry->get('language'); $columns_count=1; ?>
<?php if( count($testimonials) ) { ?>
	<?php $id = rand(1,10)+rand();?>
   	<div id="pavtestimonial<?php echo $id;?>" class="panel testimonials <?php echo $setting['class'];?>">
   		<div class="panel-heading">
			<h4 class="panel-title"><?php echo $objlang->get("text_testimonial");?></h4>
		</div>
		<div class="panel-body space-padding-30 owl-carousel-play"  data-ride="owlcarousel">
			<div class="owl-carousel"  data-show="<?php echo ($columns_count); ?>" data-pagination="false" data-navigation="true">
				<?php $pages = array_chunk( $testimonials, $cols); $span = 12/$cols; ?>
				<?php foreach ($pages as  $k => $testimonials ) { ?>
					<div class="item <?php if($k==0) {?>active<?php } ?>">
						<?php foreach ($testimonials as $i => $testimonial) {  ?>
							<?php if( $i++%$cols == 0 ) { ?>
							<div class="row">
							<?php } ?>
				 				<div class="col-md-<?php echo $span;?> col-sm-<?php echo $span;?> col-xs-12 column">
				 					<div class="testimonial-item testimonials-wrap">
				 						<?php if(  $testimonial['thumb'] ) { ?>
				 						<div class="testimonials-avatar hidden">
				 						<img  alt="<?php echo strip_tags($testimonial['profile']); ?>" src="<?php echo $testimonial['thumb']; ?>" class="img-circle"/>
				 						<?php if( $testimonial['video_link']) { ?>
											<a title="" href="<?php echo $testimonial['video_link'];?>" class="iframe-link icon" data-placement="top" data-toggle="tooltip" data-original-title="Video"><i class="fa fa-camera"></i>
	      									</a>
										<?php } ?>

				 						</div>
				 						<?php } ?>
										
										<div class="testimonials-body">
										<?php if(  $testimonial['description'] ) { ?>
											<?php echo $testimonial['description'];?>
										<?php } ?>		
										<?php if(  $testimonial['profile'] ) { ?>										
										<div class="testimonials-profile"><?php echo $testimonial['profile']; ?></div>
										<?php } ?>
										</div>
									</div>
								</div>
							<?php if( $i%$cols == 0 || $i==count($testimonials) ) { ?>
							</div>
							<?php } ?>
						<?php } ?>
					</div>
				<?php }?>			
			</div>
			<?php if( count($testimonials) / $cols > 0 ){ ?>
				<div class="carousel-controls carousel-controls-v3">
					<a class="carousel-control left carousel-sm" href="#pavtestimonial<?php echo $id;?>" data-slide="prev"><i class="md md-arrow-back"></i></a>
					<a class="carousel-control right carousel-sm" href="#pavtestimonial<?php echo $id;?>" data-slide="next"><i class="md md-arrow-forward"></i></a>
				</div>
			<?php } ?>		
    	</div>
    </div>
    <?php if( count($testimonials) / $cols > 0 ){ ?>
	<script type="text/javascript">
		$('#pavtestimonial<?php echo $id;?>').carousel({interval:<?php echo ( $auto_play_mode?$interval:'false') ;?>,auto:<?php echo $auto_play;?>,pause:'hover'});
	</script>
	<?php } ?>
<?php } ?>
