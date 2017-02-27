$(function() {
	var havent = $("#havent").val(),
		examID = $("#examid").val();
	console.log(havent);
	if (havent == "0"){
		$.ajax({
			method: 'GET',
			url: '../handle/isScored.jsp',
			dateType: 'json',
			data: {
				examID:examID,
			},
			success:function() {
				parent.location.reload();
			},
		});
	}
});