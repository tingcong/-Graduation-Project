$(function() {
	$('.funclist ul.funclistul').find('> li:eq(0)').addClass('current');
	var src = $('.funclist ul.funclistul').find('> li:eq(0)').attr("id");
	$("#frame_content").attr("src",src)
	$('.funclist ul.funclistul li a').click(function (g) { 
		var tab = $(this).closest('.funclist')
		tab.find('ul.funclistul > li').removeClass('current');
		$(this).closest('li').addClass('current');
		g.preventDefault();
		src = $(this).closest('li').attr("id");
		$("#frame_content").attr("src",src)
	} );
});