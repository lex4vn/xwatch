<?php 
  /*
  * @package Framework for Opencart 2.0
  * @version 2.0
  * @author http://www.pavothemes.com
  * @copyright Copyright (C) Feb 2013 PavoThemes.com <@emai:pavothemes@gmail.com>.All rights reserved.
  * @license   GNU General Public License version 2
  */
  require_once(DIR_SYSTEM . 'pavothemes/loader.php');
  $config = $this->registry->get('config'); 
  $helper = ThemeControlHelper::getInstance( $this->registry, $config->get('config_template') );
  $helper->loadFooterModules();
  $layoutID = 1 ;
  $objlang = $this->registry->get('language'); 
?>
 
<!-- 
  $ospans: allow overrides width of columns base on thiers indexs. format array( column-index=>span number ), example array( 1=> 3 )[value from 1->12]
 -->

<?php if( !($helper->getConfig('enable_pagebuilder') && $helper->isHomepage())  ){ ?>

<?php
  $blockid = 'mass_bottom';
  $blockcls = '';
 
  $ospans = array(1=>6,2=>6);
  $tmcols = 'col-sm-12 col-xs-12 border-line';
  require( ThemeControlHelper::getLayoutPath( 'common/block-cols.tpl' ) );
?>

<?php } ?>
 
<footer id="footer">
 
  <?php
    $blockid = 'footer_top';
    $blockcls = '';
    $ospans = array();
    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
  ?>


  <?php

    $blockid = 'footer_center';
    $blockcls = '';
    $ospans = array(1=>2,2=>2,3=>2,4=>3,5=>3);
   
      require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );

      if( count($modules) <=0 ){
          require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_center.tpl' ) );
      }
  ?>

  <?php
    $blockid = 'footer_bottom';
    $blockcls = '';
    $ospans = array();

    require( ThemeControlHelper::getLayoutPath( 'common/block-footcols.tpl' ) );
    if( count($modules) <=0 ){
       require( ThemeControlHelper::getLayoutPath( 'common/footer/footer_bottom.tpl' ) );      
    }
  ?>


</footer>
 
<div id="powered">
  <div class="container">
    <div class="inside">
      <div class="clearfix space-padding-tb-10">
        <div class="copyright pull-left">
        <?php if( $helper->getConfig('enable_custom_copyright', 0) ) { ?>
          <?php echo html_entity_decode($helper->getConfig('copyright')); ?>
        <?php } else { ?>
          <?php echo $powered; ?>. 
        <?php } ?>
        </div> 
        <div class="pull-right">
          <?php if( $content=$helper->getLangConfig('widget_papal') ) {?>
          <?php echo $content; ?>            
          <?php } ?> 
        </div>         
      </div>
  </div>
</div>

</div>
<div id="top" class="bo-social-icons">
    <a href="#" class="bo-social-gray radius-x scrollup"><i class="fa fa-angle-up"></i></a>
  </div>


<?php if( $helper->getConfig('enable_paneltool',0) ){  ?>
  <?php  echo $helper->renderAddon( 'panel' );?>
<?php } ?>

</div>
<?php
  $offcanvas = $helper->getConfig('offcanvas','category');
  if($offcanvas == "megamenu") {
      echo $helper->renderAddon( 'offcanvas');
  } else {
      echo $helper->renderAddon( 'offcanvas-category');
  }

  ?> 
</div>
<?php echo html_entity_decode($config_chat_online); ?>
</body></html>


