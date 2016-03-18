<table class="table">
 <tr>
    <td class="col-xs-3">
    	<h5><span class="required">* </span><strong><?php echo $entry_code; ?></strong></h5>
        <span class="help"><i class="fa fa-info-circle"></i>&nbsp;<?php echo $entry_code_help; ?></span></td>
    <td class="col-xs-9">
        <div class="col-xs-4">
            <select id="Checker" name="<?php echo $moduleName; ?>[Enabled]" class="form-control">
                  <option value="yes" <?php echo (!empty($moduleData['Enabled']) && $moduleData['Enabled'] == 'yes') ? 'selected=selected' : '' ?>><?php echo $text_enabled; ?></option>
                  <option value="no"  <?php echo (empty($moduleData['Enabled']) || $moduleData['Enabled']== 'no') ? 'selected=selected' : '' ?>><?php echo $text_disabled; ?></option>
            </select>
        </div>
    </td>
    </tr>
    <tbody id="Settings">
    <tr>
        <td class="col-xs-3">
        	<h5><strong>Button text:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Please specify the button text.</span></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
            	<div style="height:5px;"></div>
				<?php foreach ($languages as $lang) : ?>
                        <div class="input-group">
                            <span class="input-group-addon"><img src="view/image/flags/<?php echo $lang['image']; ?>" title="<?php echo $lang['name']; ?>" /> <?php echo $lang['name']; ?>:</span> 
                            <input type="text" class="form-control" name="<?php echo $moduleName; ?>[ButtonName][<?php echo $lang['code']; ?>]" value="<?php if(isset($moduleData['ButtonName'][$lang['code']])) { echo $moduleData['ButtonName'][$lang['code']]; } else { echo "Buy Now"; }?>" />           
                        </div>
                    <br />
				<?php endforeach;?>
            </div>
        </td>
    </tr>
    <tr>
        <td class="col-xs-3">
        	<h5><strong>Add "Buy Now" button for:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Please choose.</span></td>
        <td class="col-xs-9">
            <div class="col-xs-4">
                <select id="SelectOption" name="<?php echo $moduleName; ?>[ShowWhere]" class="form-control">
                      <option value="specific_products" <?php echo (!empty($moduleData['ShowWhere']) && $moduleData['ShowWhere'] == 'specific_products') ? 'selected=selected' : '' ?>>Specific products</option>
                      <option value="all_products"  <?php echo (empty($moduleData['ShowWhere']) || $moduleData['ShowWhere']== 'all_products') ? 'selected=selected' : '' ?>>All products</option>
                </select>
            </div>
        </td>
    </tr>
    <tr id="ProductsAreaInput">
	  <td class="col-xs-3">
			<h5><strong>Products:</strong></h5>
            <span class="help"><i class="fa fa-info-circle"></i>&nbsp;Choose which products to have the "Buy Now" functionality. (Autocomplete)</span></td>
      <td class="col-xs-9">
      	<div class="col-xs-4">
            <input type="text" name="products" value="" class="form-control" />
        </div>
      </td>
    </tr>
    <tr id="ProductsAreaBox">
      <td class="col-xs-3" style="vertical-align: top;">
			<h5><strong>Selected products:</strong></h5>
			<span class="help"><i class="fa fa-info-circle"></i>&nbsp;The selected products will appear here.</span></td>
      </td>
	  <td class="col-xs-9">
     	 <div class="col-xs-4">
      		<div id="product" class="well well-sm" style="height:140px;">
                <?php if (!empty($moduleData['Products'])) {
                    foreach ($moduleData['Products'] as $pr) { 
                        $product = $modelProduct->getProduct($pr); ?>
                        <div id="products-<?php echo $pr; ?>"> 
                            <?php echo $product['name']; ?>&nbsp;<i class="fa fa-minus-circle"></i>
                            <input type="hidden" name="<?php echo $moduleName; ?>[Products][]" value="<?php echo $pr; ?>" />
                        </div>
                    <?php }
                } ?>
            </div>
      	 </div>
      </td>
    </tr>
    </tbody>
</table>
<script>
$(function() {
    var $toogleProductsOption = $('#SelectOption');
    var $toggle1 = $('#ProductsAreaInput');
	var $toggle2 = $('#ProductsAreaBox');
	 if ($toogleProductsOption.val() === 'specific_products') {
            $toggle1.show(); 
			$toggle2.show(); 
        }
        else
		{
            $toggle1.hide(); 
			$toggle2.hide(); 
        }
    $toogleProductsOption.change(function(){
        if ($toogleProductsOption.val() === 'specific_products') {
            $toggle1.show(300); 
			$toggle2.show(300);
        }
        else
		{
            $toggle1.hide(300);
			$toggle2.hide(300);  
        }
    });
});
</script>
<script>
$('input[name=\'products\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	}, 
	select: function(item) {
		$('input[name=\'products\']').val('');
		
		$('#product' + item['value']).remove();
		
		$('#product').append('<div id="product' + item['value'] + '">' + item['label'] + '&nbsp;<i class="fa fa-minus-circle"></i><input type="hidden" name="<?php echo $moduleName; ?>[Products][]" value="' + item['value'] + '" /></div>');

	}
});

$('#product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

$(function() {
    var $typeSelector = $('#Checker');
    var $toggleArea = $('#Settings');
	 if ($typeSelector.val() === 'yes') {
            $toggleArea.show(); 
        }
        else {
            $toggleArea.hide(); 
        }
    $typeSelector.change(function(){
        if ($typeSelector.val() === 'yes') {
            $toggleArea.show(300); 
        }
        else {
            $toggleArea.hide(300); 
        }
    });
});
</script>