// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// $(document).on("ready page:change", function(){
$(document).on("ready", function(){
	$("ul.catalog img").click(function(e){
		$(this).closest("li").find("input[type=submit]").click()
		e.stopPropagation();
	})
})