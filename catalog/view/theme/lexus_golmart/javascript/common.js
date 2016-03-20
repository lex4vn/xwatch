function wpo_play_owl_carousel( owl ){
    var $ = jQuery; 

    var config = {
        navigation : false, // Show next and prev buttons
        slideSpeed : 300,
        paginationSpeed : 400,
        pagination : $(owl).data( 'pagination' )
     }; 
     
    if( $(owl).data('show') == 1 ){
        config.singleItem = true;
    }else {
        config.items = $(owl).data( 'show' );
    }
    $(owl).owlCarousel( config );
    $('.left',$(owl).parent()).click(function(){
          owl.trigger('owl.prev');
          return false; 
    });
    $('.right',$(owl).parent()).click(function(){
        owl.trigger('owl.next');
        return false; 
    });
}
// offcanvas menu 
$(document).ready(function () {

   var timeout;
    $('.product-feature-carousel .carousel-inner').css("overflow","inherit");
    $(".carousel-control").each(function(){
        $(this).click(function(){
            $(".carousel-inner ").css("overflow","hidden");
            $('.product-feature-carousel .carousel-inner').css("overflow","inherit");
            clearTimeout(timeout);
      });
    });

    $(".carousel-inner .product-block:first-child").mouseenter(function() {
      $(".carousel-inner").css("overflow", "inherit");
      $('.product-feature-carousel .carousel-inner').css("overflow","inherit");
    });

    $(".carousel-inner").mouseleave(function() {
      $(".carousel-inner").css("overflow", "hidden");
      $('.product-feature-carousel .carousel-inner').css("overflow","inherit");
    });
    
  // Language
  $('.language a').on('click', function(e) {
    e.preventDefault();

    $('.language input[name=\'code\']').attr('value', $(this).attr('href'));

    $('.language').submit();
  });
  /** 
   * 
   * Automatic apply  OWL carousel
   */
   $(".owl-carousel-play .owl-carousel").each( function(){
      var owl = $(this);
      wpo_play_owl_carousel( owl );
   } ); 
  // Currency
  $('.currency .currency-select').on('click', function(e) {
    e.preventDefault();

    $('.currency input[name=\'code\']').attr('value', $(this).attr('data-name'));

    $('.currency').submit();
  });

  // Search
  $('#search input[name=\'search\']').parent().find('button').on('click', function() {
    url = $('base').attr('href') + 'index.php?route=product/search';
    var value = $('#search input[name=\'search\']').val();
    if (value) {
      url += '&search=' + encodeURIComponent(value);
    }
    location = url;
  });
  $('#search input[name=\'search\']').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#search input[name=\'search\']').parent().find('button').trigger('click');
    }
  });

  //fix search popup
  $('.btn-group.search-focus').bind('click',function(e) {
        if($(this).hasClass('active')){
            $('.nav-search').removeClass('open');
            $(this).removeClass('active');
        }else{
            $(this).addClass('active');
            $('.nav-search').addClass('open');
            $('.nav-search .input-group input[type="text"]').focus();
        }
    });

    $('.nav-search .input-group-btn').bind('click',function(e){
        if($('.btn-group.search-focus').hasClass('active')){
            $('.nav-search').removeClass('open');
            $('.btn-group.search-focus').removeClass('active');
        }
    });

  // Search offcanvas
  $('#offcanvas-search input[name=\'search\']').parent().find('button').on('click', function() {
    url = $('base').attr('href') + 'index.php?route=product/search';
    var value = $('#offcanvas-search input[name=\'search\']').val();
    if (value) {
      url += '&search=' + encodeURIComponent(value);
    }
    location = url;
  });
  $('#offcanvas-search input[name=\'search\']').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('#offcanvas-search input[name=\'search\']').parent().find('button').trigger('click');
    }
  });

  
  
  // Adding the clear Fix
  cols1 = $('#column-right, #column-left').length;
  	
  if (cols1 == 2) {
  	$('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
  } else if (cols1 == 1) {
  	$('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
  } else {
  	$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
  }
  
});

$(document).ready(function() {
  	$('.product-zoom').magnificPopup({
  		  type: 'image',
            closeOnContentClick: true,
   
            image: {
              verticalFit: true
            }
  	});

	  $('.iframe-link').magnificPopup({
      type:'iframe'
    });

// scroll-to-top button show and hide
    jQuery(document).ready(function(){
        jQuery(window).scroll(function(){
            if (jQuery(this).scrollTop() > 100) {
                jQuery('.scrollup').fadeIn();
            } else {
                jQuery('.scrollup').fadeOut();
        }
    });
    // scroll-to-top animate
    jQuery('.scrollup').click(function(){
        jQuery("html, body").animate({ scrollTop: 0 }, 600);
            return false;
        });

        
    });
    //  Fix First Click Menu /
  $(document.body).on('click', '.megamenu [data-toggle="dropdown"], .verticalmenu [data-toggle="dropdown"]' ,function(){
      if(!$(this).parent().hasClass('open') && this.href && this.href != '#'){
          window.location.href = this.href;
      }
  });

  $('[data-toggle="offcanvas"]').click(function () {
    $('.row-offcanvas').toggleClass('active')
  });
  
});


$(document).ready(function(){

    $('.dropdown-menu input').click(function(e) {
        e.stopPropagation();
    });

    // grid list switcher
    $("button.btn-switch").bind("click", function(e){
        e.preventDefault();
        var theid = $(this).attr("id");
        var row = $("#products");

        if($(this).hasClass("active")) {
            return false;
        } else {
            if(theid == "list-view"){
                $('#list-view').addClass("active");
                $('#grid-view').removeClass("active");

                // remove class list
                row.removeClass('product-grid');
                // add class gird
                row.addClass('product-list');
                
            }else if(theid =="grid-view"){
                $('#grid-view').addClass("active");
                $('#list-view').removeClass("active");

                // remove class list
                row.removeClass('product-list');
                // add class gird
                row.addClass('product-grid');

            }
        }
    });


    $(".quantity-adder .add-action").click( function(){
        if( $(this).hasClass('add-up') ) {  
            $("[name=quantity]",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) + 1 );
        }else {
            if( parseInt($("[name=quantity]",'.quantity-adder').val())  > 1 ) {
                $("input",'.quantity-adder').val( parseInt($("[name=quantity]",'.quantity-adder').val()) - 1 );
            }
        }
    } );
    /****/
    $(document).ready(function() {
        $('.popup-with-form').magnificPopup({
              type: 'inline',
              preloader: false,
              focus: '#input-name',

              // When elemened is focused, some mobile browsers in some cases zoom in
              // It looks not nice, so we disable it:
              callbacks: {
                beforeOpen: function() {
                  if($(window).width() < 700) {
                    this.st.focus = false;
                  } else {
                    this.st.focus = '#input-name';
                  }
                }
              }
        });
    });
});

// Cart add remove functions
var cart = {
  'addcart': function(product_id, quantity) { 
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      success: function(json) {
        $('.alert, .text-danger').remove();

        if (json['redirect']) {
          location = json['redirect'];
        }

        if (json['success']) {
          $('html, body').animate({ scrollTop: 0 }, 'fast');

          var html = '<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
           $('#notification').html(html);
           $("#pav-modalbox .modal-body").html( html );
          $("#pav-modalbox").modal('show');  

          if( $("#cart-total").hasClass("cart-mini-info") ){
              json['total'] = json['total'].replace(/-(.*)+$/,"");
          }

          var out = (json['total']) ? json['total'] : '' ;
          //alert(out);
          $('#cart-total').html(out);

          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      }
    });
  },
  'update': function(key, quantity) {
    $.ajax({
      url: 'index.php?route=checkout/cart/edit',
      type: 'post',
      data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');

        $('#cart-total').html(json['total']);
        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      }
    });
  },
  'remove': function(key) {
    $.ajax({
      url: 'index.php?route=checkout/cart/remove',
      type: 'post',
      data: 'key=' + key,
      dataType: 'json',
      beforeSend: function() {
        $('#cart > button').button('loading');
      },
      success: function(json) {
        $('#cart > button').button('reset');

        var out = (json['total']) ? json['total'] : ''; 
        $('#cart-total').html(out);

        if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
          location = 'index.php?route=checkout/cart';
        } else {
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
        }
      }
    });
  }
}

var wishlist = {
  'addwishlist': function(product_id) {
    $.ajax({
      url: 'index.php?route=account/wishlist/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        $('.alert').remove();

        if (json['success']) {
          $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }

        if (json['info']) {
          $('#notification').html('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }

        $('#wishlist-total').html(json['total']);

        $('html, body').animate({ scrollTop: 0 }, 'slow');
      }
    });
  },
  'remove': function() {

  }
}

var compare = {
  'addcompare': function(product_id) {
    $.ajax({
      url: 'index.php?route=product/compare/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        $('.alert').remove();

        if (json['success']) {
          $('#notification').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('#compare-total').html(json['total']);

          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }
      }
    });
  },
  'remove': function() {

  }
}

// scroll widget
$(document).ready(function() { 

    // add image + title form sidebar
    $('.product-scroll').each(function(){
      var this_id = $(this).attr("id");
      var src_img = $('.image-icon-item img',this).attr('src');
      var this_title = $('.image-icon-item span',this).html();
      var html = '<li><a href="#'+this_id+'"><img class="img-responsive" src="'+src_img+'"/><span>'+this_title+'</span></a></li>';
      $('.bs-docs-sidebar ul').append(html);
    });
    
    $('body').scrollspy({
      target: '.bs-docs-sidebar',
      offset: 60
    });

    $('.bs-docs-sidebar li a').click(function(event) {

      if(!$(this).closest('li').hasClass('active')){
        $('.bs-docs-sidebar li').removeClass('active');
        $(this).closest('li').addClass('active');
      }  
      event.preventDefault();
      $($(this).attr('href'))[0].scrollIntoView();
      //scrollBy(0, -200);

    });   

});

// scroll hidden sidebar
$(window).scroll(function(){
  $('.bs-docs-sidebar').addClass('hidden');
	if (($(".product-scroll").length > 0)){
		var viewableOffset = $(".product-scroll").first().offset().top - $(window).scrollTop(); 
		//var scrollBottom =  $("#pavo-mass-bottom").first().offset().top - $(window).scrollTop();

   // console.log("top: " + viewableOffset);
   // console.log("last: " + scrollBottom);

		if(viewableOffset <= 40 ) {
      $('.bs-docs-sidebar').removeClass('hidden');
    }
    if(viewableOffset >= 700){
      $('.bs-docs-sidebar').addClass('hidden');
    }
	 // if(scrollBottom <= 590){
  //     $('.bs-docs-sidebar').addClass('hidden');
  //   }
		
	} 
});