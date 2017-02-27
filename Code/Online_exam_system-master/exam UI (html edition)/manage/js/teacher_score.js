$(function() {
	var one_block_num = $('.one_block').length,
		filled_block_num = 0,
		page = 10,
		current_page = 0;
	$('#page').html(page);
	$('#current_page').html(current_page);
	$('#next').attr("disabled",true);
	$('.one_block').on('change',function(){
		if ($(this).val() == "") {
			filled_block_num -= 1;
		}
		else {
			filled_block_num += 1;
		}
		if (filled_block_num == one_block_num) {
			$('#next').attr("disabled",false);
		}
		else {
			$('#next').attr("disabled",true);
		}
	});
	$('#next').on('click',function(){
		$('.one_block').val("");
		filled_block_num = 0;
		$('#next').attr("disabled",true);
		current_page += 1;
		$('#current_page').html(current_page);
		if (current_page==page) {
			$('#next').html("提交");
		}
	});
});