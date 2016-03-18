$.ajax({
	url: 'index.php?route=module/buynow/getproducts',
	dataType: 'json',
	success: function(json) {
		if (json['enabled']) {
			if (json['products']) {
				var t = null;
				var BuyNow = json['products'];
				if (BuyNow=='all') { 
					t = $('[onclick^="cart.add(\'"]');
					BuyNow = [1];
				}
				for (var x=0;x<BuyNow.length;x++) {
					if (json['products']!='all') {
						t = $('[onclick^="cart.add(\''+BuyNow[x]+'"]');
					}
					if (t.size()) {
						if (t[0].tagName == 'INPUT') {
							t.attr('value', json['button']);	
						}
						if (t[0].tagName == 'A') {
							t.html(json['button']);	
						}
						if (t[0].tagName == 'BUTTON') {
							t.find('span').text(json['button']);	
						}
					}
				}
			}
		}
	}
});