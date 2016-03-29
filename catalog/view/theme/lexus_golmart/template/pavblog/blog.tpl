<?php  echo $header; ?>
<?php require( ThemeControlHelper::getLayoutPath( 'common/mass-header.tpl' )  ); ?>

<div class="main-columns container space-20">
<div class="container-inside">
	<div class="row">
		<?php if( $SPAN[0] ): ?>
		<aside id="sidebar-left" class="col-md-<?php echo $SPAN[0];?>">
		  <?php echo $column_left; ?>
		</aside>	
	    <?php endif; ?> 
		<div class="col-md-<?php echo $SPAN[1];?>"><div id="content" class="space-padding-20 bg-white"><?php echo $content_top; ?>
		
		<!-- <h1><?php //echo $blog['title'];?></h1> -->
		<!-- Start Div Content -->
		<div class="pav-blog">

			<?php if( $blog['thumb_large'] ) { ?>
				<img class="img-responsive space-10 space-padding-r20" src="<?php echo $blog['thumb_large'];?>" title="<?php echo $blog['title'];?>" align="left"/>
			<?php } ?>
			<div class="blog-content">
				<div class="description"><?php echo $description;?></div>
				<div class="content-wrap">
				<?php echo $content;?>
				</div>
				<?php if( $blog['video_code'] ) { ?>
				<div class="pav-video"><?php echo html_entity_decode($blog['video_code'], ENT_QUOTES, 'UTF-8');?></div>
				<?php } ?>
			</div>

			<hr>

			<?php if ($blogs) {  $heading_title = $text_blog_related; $customcols = 4; ?>
			<div class="blog-grid space-top-20 panel-v3 panel-primary related"> 
			<?php require( PAVO_THEME_DIR."/template/common/blog_module.tpl" );  ?>
			</div>
			<?php } ?>
			
			<hr>
			<?php if ($products) {  $heading_title = $text_product_related; $customcols = 4; ?>
			<div class="product-grid space-top-20 panel-v3 panel-primary related"> 
			<?php require( PAVO_THEME_DIR."/template/common/products_module.tpl" );  ?>
			</div>
			<?php } ?>
			
			<div class="pav-comment">
				<?php if( $config->get('blog_show_comment_form') ) { ?>
					<?php if( $config->get('comment_engine') == 'diquis' ) { ?>
				    <div id="disqus_thread"></div>
					<script type="text/javascript">
						//CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE 
						var disqus_shortname = '<?php echo $config->get('diquis_account');?>'; // required: replace example with your forum shortname

						//DON'T EDIT BELOW THIS LINE
						(function() {
							var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
							dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
							(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
						})();
					</script>
					<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
					<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>

					<?php } elseif( $config->get('comment_engine') == 'facebook' ) { ?>
					<div id="fb-root"></div>
					<script>(function(d, s, id) {
					  var js, fjs = d.getElementsByTagName(s)[0];
					  if (d.getElementById(id)) {return;}
					  js = d.createElement(s); js.id = id;
					  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=<?php echo $config->get("facebook_appid");?>";
					  fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));</script>
					<div class="fb-comments" data-href="<?php echo $link; ?>" 
							data-num-posts="<?php echo $config->get("comment_limit");?>" data-width="<?php echo $config->get("facebook_width")?>">
					</div>
					<?php }else { ?>
						<?php if( count($comments) ) { ?>
						<h4><?php echo $objlang->get('text_list_comments'); ?></h4>
						<div class="pave-listcomments">
							<?php foreach( $comments as $comment ) {  $default='';?>
							<div class="comment-item media clearfix" id="comment<?php echo $comment['comment_id'];?>">
								<div class="media-left">
									<img src="<?php echo "http://www.gravatar.com/avatar/" . md5( strtolower( trim( $comment['email'] ) ) ) . "?d=" . urlencode( $default ) . "&s=60" ?>"/>
								</div>
								<div class="comment-wrap media-right">
									<div class="comment-meta">
									<span class="comment-created"><?php echo $objlang->get('text_created');?> <span><?php echo $comment['created'];?></span></span>
									<span class="comment-postedby"><?php echo $objlang->get('text_postedby');?> <span><?php echo $comment['user'];?></span></span>
									<span class="comment-link"><a href="<?php echo $link;?>#comment<?php echo $comment['comment_id'];?>"><?php echo $objlang->get('text_comment_link');?></a></span>
									</div>
									<?php echo $comment['comment'];?>
								</div>
							</div>
							<?php } ?>
							<div class="pagination">
								<?php echo $pagination;?>
							</div>
						</div>
						<?php } ?>
						<h4><?php echo $objlang->get("text_leave_a_comment");?></h4>
						<form action="<?php echo $comment_action;?>" method="post" id="comment-form" class="form-horizontal">
							<fieldset>
								
								<div class="message" style="display:none"></div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="comment-user"><?php echo $objlang->get('entry_name');?></label>
									<div class="col-sm-8">
										<input class="form-control" type="text" name="comment[user]" value="" id="comment-user"/>
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="comment-email"><?php echo $objlang->get('entry_email');?></label>
									<div class="col-sm-8">
										<input class="form-control" type="text" name="comment[email]" value="" id="comment-email"/>
									</div>
								</div>

								<div class="form-group required">
									<label class="col-sm-2 control-label" for="comment-comment"><?php echo $objlang->get('entry_comment');?></label>
									<div class="col-sm-8">
										<textarea class="form-control" name="comment[comment]"  id="comment-comment"></textarea>
									</div>
								</div>

								<?php if ($site_key) { ?>
										<div class="form-group">
											<div class="col-sm-offset-2 col-sm-10">
											<div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
												<?php if ($error_captcha) { ?>
												<div class="text-danger"><?php echo $error_captcha; ?></div>
												<?php } ?>
											</div>
										</div>
									<?php } ?>
								<input type="hidden" name="comment[blog_id]" value="<?php echo $blog['blog_id']; ?>" />									
								<div class="buttons col-sm-6">
		                            <button class="btn btn-default" type="submit">
										<span><?php echo $objlang->get('text_submit');?></span>
									</button>
		                    	</div>
							</fieldset>
						</form>
						<script type="text/javascript">
							$( "#comment-form .message" ).hide();
							$("#comment-form").submit( function(){
								$.ajax( {type: "POST",url:$("#comment-form").attr("action"),data:$("#comment-form").serialize(), dataType: "json",}).done( function( data ){
									if( data.hasError ){
										$( "#comment-form .message" ).html( data.message ).show();	
									}else {
										location.href='<?php echo str_replace("&amp;","&",$link);?>';
									}
								} );
								return false;
							} );
							
						</script>
					<?php } ?>
				<?php } ?>
			</div> <!-- end pav-comment -->
		</div> <!-- end pav-blog -->
		<!-- End Div Content -->
		<?php echo $content_bottom; ?></div>
	</div>
		<!-- End Div Row -->
		<?php if( $SPAN[2] ): ?>
		<aside id="sidebar-right" class="col-md-<?php echo $SPAN[2];?>">	
		<?php echo $column_right; ?>
		</aside>
	<?php endif; ?>
	</div>
</div>
</div><!-- End Div Container -->
<?php echo $footer; ?>