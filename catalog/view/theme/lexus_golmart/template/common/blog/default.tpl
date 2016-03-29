

<?php 
$load = $this->registry->get("load");
$language = $load->language("module/themecontrol");
$text_sale = $language['text_sale'];
$ourl = $this->registry->get('url'); 
$objlang = $this->registry->get('language'); 
?>

<div class="product-block item-default" itemtype="http://schema.org/Product" itemscope> 
  <div class="block-img text-center">
      <?php if ($product['thumb']) {    ?>
        
        <div class="image">
          <?php if( $product['special'] ) {   ?>
            <span class="product-label sale"><span class="product-label-special"><?php echo $objlang->get('text_sale'); ?></span></span>
          <?php } ?>
          <a class="img" itemprop="url" title="<?php echo $product['name']; ?>" href="<?php echo $product['href']; ?>">
            <img class="img-responsive" itemprop="image" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          </a>
        </div>
      <?php } ?>
    
    </div>
           
    <div class="product-meta">      
      <div class="top">
         <h3 class="name" itemprop="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>

        <?php if ($product['price']) { ?>
        <div class="price" itemtype="http://schema.org/Offer" itemscope itemprop="offers">
          <?php if (!$product['special']) {  ?>
            <span class="price-new"><?php echo $product['price']; ?></span>
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['price'], $p ) ) { ?> 
            <meta content="<?php echo $p[0]; ?>" itemprop="price">
            <?php } ?>
          <?php } else { ?>
            <span class="price-new"><?php echo $product['special']; ?></span>
            <span class="price-old"><?php echo $product['price']; ?></span> 
            <?php if( preg_match( '#(\d+).?(\d+)#',  $product['special'], $p ) ) { ?> 
            <meta content="<?php echo $p[0]; ?>" itemprop="price">
            <?php } ?>

          <?php } ?>
          <meta content="<?php // echo $this->currency->getCode(); ?>" itemprop="priceCurrency">
        </div>
        <?php } ?>    
          <?php if( isset($product['description']) ){ ?> 
      <p class="description" itemprop="description"><?php echo utf8_substr( strip_tags($product['description']),0,220);?>...</p>
      <?php } ?>     
    
      </div>
      <div class="bottom">
        <div class="action">
          <?php if( !isset($listingConfig['catalog_mode']) || !$listingConfig['catalog_mode'] ) { ?>
          <div class="cart">            
            <a class="btn" href="#" onclick="cart.addcart('<?php echo $product['product_id']; ?>');">
              Add to cart
            </a>
          </div>
         <?php } ?>
        </div>
    </div>
  </div>  
</div>





