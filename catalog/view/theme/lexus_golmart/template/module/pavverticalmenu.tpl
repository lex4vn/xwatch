 <?php
 $this->language( 'module/themecontrol' );
  $objlang = $this->registry->get('language');

?>
 <div class="dropdown">
           <div class="panel panel-default space-top-10">
            <div class="bg-default panel-heading">
            <h4 class="panel-title white font-size-14">
              <?php echo $objlang->get("text_all_category"); ?>
              <span class="pull-right fa fa-angle-down red font-size-18"></span>
            </h4>
            </div>
          </div>        
	<div class="pav-verticalmenu">
		<div class="navbar navbar-default">
			<div  class="verticalmenu" role="navigation">
				<div class="navbar-header">
				<a href="javascript:;" data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle">
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			     </a>
				<div class="collapse navbar-collapse navbar-ex1-collapse">
				<?php echo $treemenu; ?>
				 </div></div>
			</div>
		</div>
	</div>
</div>