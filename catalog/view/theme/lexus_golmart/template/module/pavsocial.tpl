<div class="socials-theme right hidden-xs hidden-sm ">
	<ul class="list-socials">
		<?php //Start Div Facebook?>
		<li class="facebook">
			<div class="media">
				<div class="pull-left">
					<span class="fa fa-facebook"></span>
				</div>
				<div class="media-body">
					<span>facebook</span>
				</div>
			</div>

			<div class="box-content">
					<div class="facebook-wrapper" style="width:<?php echo  $width;?>" >
						<?php if(isset($application_id) && $application_id) { ?>
							<div id="fb-root"></div>
							<script>(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = "//connect.facebook.net/<?php echo $language_code ?>/all.js#xfbml=1&appId=<?php echo $application_id ?>";
							fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
						<?php } else {?>
							<script>(function(d, s, id) {
							var js, fjs = d.getElementsByTagName(s)[0];
							if (d.getElementById(id)) return;
							js = d.createElement(s); js.id = id;
							js.src = "//connect.facebook.net/<?php echo $language_code ?>/all.js#xfbml=1";
							fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
							<?php } ?>

						<div class="fb-like-box" data-href="<?php echo $page_url; ?>" data-colorscheme="<?php echo $colorscheme;?>" data-height="<?php echo $face_height; ?>" data-width="<?php echo $face_width; ?>" data-show-faces="<?php echo ($show_faces ? 'true' : 'false'); ?>" data-stream="<?php echo ($tream ? 'true' : 'false'); ?>" data-show-border="<?php echo ( trim($border_color) ?'true':'false') ; ?>" data-header="<?php echo ($header ? 'true' : 'false'); ?>"></div>
					</div>
			</div>
		</li>
		<?php //End Div Facebook?>

		<?php if (!empty($widget_id)) { //Start Div Twitter?>
		<li class="twitter">
			<div class="media">
				<div class="pull-left">
					<span class="fa fa-twitter"></span>
				</div>
				<div class="media-body">
					<span>twitter</span>
				</div>
			</div>
			<div class="box-content">
				<div id="pav-twitter">
					<a class="twitter-timeline" data-dnt="true" data-theme="<?php echo $theme; ?>" data-link-color="#<?php echo $link_color;?>" data-chrome="<?php echo $chrome; ?>" data-border-color="#<?php echo $border_color ?>" lang="<?php echo $language_code;?>" data-tweet-limit="<?php echo $count; ?>" data-show-replies="<?php echo $show_replies==1?'true':'false'; ?>" href="https://twitter.com/<?php echo $username; ?>"  data-widget-id="<?php echo $widget_id; ?>">Tweets by @<?php echo $username;?></a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
				</div>
			</div>
		</li>
		<?php } //End Div Twitter?>


	
		<?php if (isset($video_ids) && !empty($video_ids)) {?>
		<li class="youtube">
			<div class="media">
				<div class="pull-left">
					<span class="fa fa-youtube"></span>
				</div>
				<div class="media-body">
					<span>youtube</span>
				</div>
			</div>
			<div class="box-content">
				<iframe width="220" height="220" src="http://www.youtube.com/embed/<?php echo trim($video_ids); ?>?autoplay=0"></iframe> 
			</div>
		</li>
		<?php } ?>

		<?php  if (!empty($google)) { ?>
		<li class="google-plus">
			<div class="media">
				<div class="pull-left">
					<span class="fa fa-google-plus"></span>
				</div>
				<div class="media-body">
					<span>Google plus</span>
				</div>
			</div>

			<div class="box-content">
				<div class="g-plus" data-action="followers" data-height="<?php echo $google_height; ?>" data-href="<?php echo $google; ?>" data- source="blogger:blog:followers" data-width="<?php echo $google_width; ?>"> </div> 
				<script type="text/javascript">
					(function() {
					window.___gcfg = {'lang': 'en'};
					var po = document.createElement('script');
					po.type = 'text/javascript';
					po.async = true;
					po.src = 'https://apis.google.com/js/plusone.js';
					var s = document.getElementsByTagName('script')[0];
					s.parentNode.insertBefore(po, s);
					})();
				</script>
			</div>
		</li>	
		<?php } ?>
		<?php if (!empty($url)) { ?>
		<li class="url">
			<div class="media">
				<div class="pull-left">
					<span class="fa fa-pencil"></span>
				</div>
				<div class="media-body">
					<span>Url</span>
				</div>
			</div>
			<div class="box-content">
			<a href="<?php echo $url; ?>" target="_blank">Links</a>
			</div>
		</li>
		<?php } ?>
	</ul>	
	<div class="bo-social-icons">
		<a href="javascript:void(0);" class="bo-social-gray radius-x"><i class="md md-close"></i></a>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".bo-social-icons").click(function() {
			if ( $(this).find("i").is( ".md-close" ) ) {
				$("ul.list-socials").hide();
				$(this).find("i").removeClass("md md-close").addClass("fa fa-play");
			} else {
				$("ul.list-socials").show();
				$(this).find("i").removeClass("fa fa-play").addClass("md md-close");
			}
		});
	});

</script>

<script type="text/javascript">
// Customize twitter feed
var hideTwitterAttempts = 0;
function hideTwitterBoxElements() {
	setTimeout( function() {
		if ( $('[id*=pav-twitter]').length ) {
			$('#pav-twitter iframe').each( function(){
				var ibody = $(this).contents().find( 'body' );
				if ( ibody.find( '.timeline .stream .h-feed li.tweet' ).length ) {
					ibody.find( '.header .p-nickname' ).css( 'color', '<?php echo $nickname_color; ?>' );
					ibody.find( '.p-name' ).css( 'color', '<?php echo $name_color; ?>' );
					ibody.find( '.e-entry-title' ).css( 'color', '<?php echo $title_color; ?>' );
				} else {
					$(this).hide();
				}
			});
		}
		hideTwitterAttempts++;
		if ( hideTwitterAttempts < 3 ) {
			hideTwitterBoxElements();
		}
	}, 1500);
}
// somewhere in your code after html page load
hideTwitterBoxElements();
</script>