$(function() {
	var usertype,
		userid = $('#userid'),
		password = $('#password'),
		checkCode_check = $('#checkCode-check'),
		checkCode = $('#checkCode');
	checkCode_check.hide();
	$('.tab ul.tabs').find('> li:eq(0)').addClass('current');	
	$('.tab ul.tabs li a').click(function (g) { 
		var tab = $(this).closest('.tab')
		tab.find('ul.tabs > li').removeClass('current');
		$(this).closest('li').addClass('current');
		usertype = $(this).closest('li').attr("id");
		g.preventDefault();
	} );
	$('#checkCode-input').on('blur', function() {
		var checkCode_input = $(this).val();
		if (checkCode_input.toUpperCase() !== checkCode.html()) {
			checkCode_check.show();
		}
		else {
			checkCode_check.hide();
		}
	});
	var createCode = function() {
		var code = '',
				codeLength = 4,			
				rand = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
		for (var i = 0; i < codeLength; i++) {
			var index = Math.floor(Math.random()*36);
			code += rand[index];
		}
		checkCode.html(code);
	};
	createCode();
});