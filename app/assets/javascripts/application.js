//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree 

// application_jquery.js
function remove_fields(link) {
	console.log('aaa')
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().before(content.replace(regexp, new_id));
}

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