//= require aim/javascripts/jquery.jstree
//= require jquery.easing
//= require foundation
//= require chosen-jquery

function toggle_filters() {

  if ($('.actual_filters').offset().left >= 0  ) {
    $('#filters').animate({left: '-20%'}); //stop(true,true).hide("slide", { direction: "left" }, 200);
    // $('.toggle_filters').animate({left :  "0%"});
    $('.toggle_filters img').attr('src', '/assets/aim/images/magnifier.png');
  } else {
    $('#filters').animate({left: '0'}); //("slide", { direction: "left" }, 200);
    // $('.toggle_filters').animate({right:  "-20%"});
    $('.toggle_filters img').attr('src', '/assets/aim/images/back_arrow.png');
  }

}

function toggle_sign_in() {
  var boxheight = $('.login_bottom').css('height');
  var signinheight = $('.sign_in').css('height');
  if ($('#user_info').is(":visible") ) {
    $('.login_bottom ').slideToggle();
    $('.sign_in').animate({top:  "-" + signinheight });
    //$('.sign_in img').attr('src', '/assets/aim/images/magnifier.png');
  } else {
    $('.login_bottom ').slideToggle();
    $('.sign_in').animate({top:  "+=" + boxheight});
    //$('.toggle_filters img').attr('src', '/assets/aim/images/back_arrow.png');
  }

}