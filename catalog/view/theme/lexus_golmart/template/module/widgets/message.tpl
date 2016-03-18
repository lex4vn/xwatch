<?php if ( isset($html)&& !empty($html) ) { ?>
<div class="alert alert-box <?php echo $alert_type; ?> <?php echo $addition_cls; ?> <?php if ( isset($stylecls)&&$stylecls ) { ?>-<?php echo $stylecls;?> <?php } ?>">
	<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
	<?php if( $icon ) { ?>
	<i class="fa <?php echo $icon; ?>"></i>
	<?php } ?>
	<?php echo $html; ?>
</div>
<?php } ?>