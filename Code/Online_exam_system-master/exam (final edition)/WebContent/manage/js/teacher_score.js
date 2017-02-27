$(function() {
	var one_block_num = $('.one_block').length,
		filled_block_num = 0,
		examID = $("#examid").val(),
		paperID = $("#paperid").val();
	$('#submit').attr("disabled",true);
	$('.one_block').on('change',function(){
		var score = $(this).val();
		var essay_id = $(this).attr("id");
		var id_no = essay_id.replace(/[^0-9]/ig,"");
		if (score == "") {
			filled_block_num -= 1;
		}
		else {
			filled_block_num += 1;
		}
		$.ajax({
			method: 'GET',
			url: '../handle/savePaper.jsp',
			dateType: 'json',
			data: {
				type:"subscore",
				examID:examID,
				paperID:paperID,
				questionID:id_no,
				score:score
			},
			success:function() {
				if (filled_block_num == one_block_num) {
					$('#submit').attr("disabled",false);
				}
				else {
					$('#submit').attr("disabled",true);
				}
			},
		});
	});
	$('#submit').on('click',function(){
		$.ajax({
			method: 'GET',
			url: '../handle/savePaper.jsp',
			dateType: 'json',
			data: {
				type:"subjective",
				examID:examID,
				paperID:paperID,
			},
			success:function() {
				parent.location.reload();
			},
		});
	});
});