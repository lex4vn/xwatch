<div class="parallax parallax-<?php if($parallaxtype == 'image'){echo 'img-v';}else{echo 'color-v';};?> <?php echo $addition_cls;?> parallax-light" sty>
    <div class="parallax-heading heading heading-v3">        
    	<?php if($iconclass){?>
            <p class="parallax-icon">
        	<i class="fa <?php echo $iconclass?>"></i>
	        <?php }elseif($iconurl && $iconfile){?>
	        	<img src="<?php echo $iconurl;?>" alt="<?php echo $heading_title?>"/>
            </p>
        <?php }?>        
        <?php if($show_title){?><h4><?php echo $heading_title;?></h4><?php }?>        
    </div>
    <div class="detail space-padding-30 width-50 space-10 font-size-16"><?php echo $content_html;?></div>
</div>
