<?php if(!empty($categories)) { ?>
<div class="box box-normal categories-count <?php echo $addition_cls; ?>">
	<div class="box-heading"> <span><?php echo $heading_title; ?></span></div>
	<div class="box-content">
		<ul class="list-inline">
			<?php foreach ($categories as $category): ?>
			<li><a href="<?php echo $category['href']; ?>">
				<img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>">
				<span><?php echo $category['name']; ?></span>
				<span><?php echo $category['items']; ?></span>
			</a></li>
			<?php endforeach ?>
		</ul>
	</div>
</div>
<?php } ?>