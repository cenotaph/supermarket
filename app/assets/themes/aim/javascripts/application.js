//= require aim/javascripts/jquery.jstree
//= require jquery.easing
//= require foundation
//= require chosen-jquery

function toggle_filters() {

  if ($('#filters').is(":visible") ) {
    $('#filters').animate({width: 'toggle'}); //stop(true,true).hide("slide", { direction: "left" }, 200);
    $('.toggle_filters').animate({left:  "-=20%"});
    $('.toggle_filters img').attr('src', '/assets/aim/images/magnifier.png');
  } else {
    $('#filters').animate({width: 'toggle'}); //("slide", { direction: "left" }, 200);
    $('.toggle_filters').animate({left:  "+=20%"});
    $('.toggle_filters img').attr('src', '/assets/aim/images/back_arrow.png');
  }

}

function toggle_sign_in() {
  var boxheight = $('.login_bottom').css('height');
  alert(boxheight);
  if ($('#user_info').is(":visible") ) {
    $('.login_bottom ').slideToggle();
    $('.sign_in').animate({top:  "-=2rem"});
    //$('.sign_in img').attr('src', '/assets/aim/images/magnifier.png');
  } else {
    $('.login_bottom ').slideToggle();
    $('.sign_in').animate({top:  "+=" + boxheight});
    //$('.toggle_filters img').attr('src', '/assets/aim/images/back_arrow.png');
  }

}