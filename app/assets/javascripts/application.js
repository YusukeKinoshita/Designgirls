//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


var $menuIcon = $('div.menu-icon');

var flg = false;

$menuIcon.click(function(){
    var $menu = $('div.menu');
    if(flg){
        flg = false;
        $menu.css('transform','translate(-' + 200 + 'px)');
    } else {
        flg = true;
        $menu.css('transform','translate(' + 0 + 'px)');
    }
});