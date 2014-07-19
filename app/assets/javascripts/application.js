// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.color
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .


// ===================================================================
// MOVE ALL THIS CODE AT END OF DOM OTHERWISE BUGGY===================
winHt = $(window).height();
sidebar = $("#sidebar-wrapper")
$("#sidebar-wrapper").css('height', winHt);
$(window).scroll(function() {
    st=$(window).scrollTop();
    console.log(st)
    if(st > 50)
    	// sidebar.addClass('fixed')
    	$("#sidebar-wrapper").addClass('fixed')
    else
    	// $sidebar.removeClass('fixed')
    	$("#sidebar-wrapper").removeClass('fixed')
})

function currentTime(){
	var d = new Date(),
    minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
    hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
    days = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];
	str = days[d.getDay()]+' '+months[d.getMonth()]+' '+d.getDate()+' '+d.getFullYear()+'<br>'+hours+':'+minutes+' '+ampm;
	$("#current_time").html("<i class=\'fa fa-clock-o\'></i>" + str)
}

$('document').ready(function(){
	currentTime();	
})
