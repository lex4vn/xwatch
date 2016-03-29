<?php $blogLayout=DIR_TEMPLATE.$config->get('config_template').'/template/common/blog/default.tpl'; ?>
<div class="panel-heading">
	<span class="starleft"><i class="fa fa-star"></i></span>
	<h3 class="panel-title"><?php echo $heading_title; ?></h3>
	<span class="starright"><i class="fa fa-star"></i></span>
</div>
<div class="panel-related-block row">
	<?php foreach ($blogs as $blog) {?>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="blog-block item-default" itemtype="http://schema.org/Product" itemscope>

			<div class="block-img text-center">
				<?php if ($blog[ 'thumb']) { ?>
				<div class="image">
					<a class="img" itemprop="url" title="<?php echo $blog['title']; ?>" href="<?php echo $blog['href']; ?>">
			            <img class="img-responsive" itemprop="image" src="<?php echo $blog['thumb']; ?>" title="<?php echo $blog['title']; ?>" alt="<?php echo $blog['title']; ?>" />
			          </a>
				</div>
				<?php } ?>
			</div>

			<div class="blog-meta">
				<div class="top">
					<h5 class="name" itemprop="name"><a href="<?php echo $blog['href']; ?>"><?php echo $blog['title']; ?></a></h5>
				</div>

			</div>
		</div>
	</div>
	<?php } ?>
</div>