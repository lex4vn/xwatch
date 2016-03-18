<div class="block troll {$addition_cls} {if isset($stylecls)&&$stylecls}block-{$stylecls}{/if}">
	<?php if( $show_title ) { ?>
	<div class="widget-heading title_block">
		<?php echo $heading_title?>
	</div>
	<?php } ?>
	<div class="block_content">
		<button class="toggle_social">Toggle</button>
		<ul class="list_social">
			<?php if( $facebook_url ) { ?><li class="facebook"><a class="_blank" href="<?php echo $facebook_url;?>">Facebook</a></li><?php } ?>
			<?php if( $twitter_url ) { ?><li class="twitter"><a class="_blank" href="<?php echo $twitter_url; ?>">Twitter</a></li><?php } ?>
			<?php if( $rss_url ) { ?><li class="rss"><a class="_blank" href="<?php echo $rss_url; ?>">RSS</a></li><?php } ?>
			<?php if( $youtube_url ) { ?><li class="youtube"><a class="_blank" href="<?php echo $youtube_url; ?>">YouTube</a></li><?php } ?>
			<?php if( $google_plus_url ) { ?><li class="google_plus"><a class="_blank" href="<?php echo $google_plus_url; ?>">Google+</a></li><?php } ?>
			<?php if( $pinterest_url ) { ?><li class="pinterest"><a class="_blank" href="<?php echo $pinterest_url; ?>">Pinterest</a></li><?php } ?>
			<?php if( $vimeo_url ) { ?><li class="vimeo"><a href="<?php echo $vimeo_url; ?>">Vimeo</a></li><?php } ?>
			<?php if( $instagram_url ) { ?><li class="instagram"><a class="_blank" href="<?php echo $instagram_url; ?>">Instagram</a></li><?php } ?>
		</ul>
	</div>
</div>
<script>
	$(".toggle_social").click(function() {
		if(!$(this).hasClass('open'))
			$(this).addClass('open');
		else
			$(this).removeClass('open');
			
		$(".list_social").toggle();
	});
</script>