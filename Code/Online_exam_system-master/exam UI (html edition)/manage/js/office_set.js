$(function() {
	var course = 0,
		begin_year = 0,
		begin_month = 0,
		begin_date = 0,
		begin_hour = 0,
		begin_minute = 0,
		end_year = 0,
		end_month = 0,
		end_date = 0,
		end_hour = 0,
		end_minute = 0;
	$('#course').selectlist({
		zIndex: 12,
		width: 300,
		height: 40,
	});
	$('#begin_year').selectlist({
		zIndex: 11,
		width: 100,
		height: 40,
	});
	$('#begin_month').selectlist({
		zIndex: 11,
		width: 100,
		height: 40,
	});
	$('#begin_date').selectlist({
		zIndex: 11,
		width: 100,
		height: 40,
	});
	$('#begin_hour').selectlist({
		zIndex: 11,
		width: 100,
		height: 40,
	});
	$('#begin_minute').selectlist({
		zIndex: 11,
		width: 100,
		height: 40,
	});
	$('#end_year').selectlist({
		zIndex: 10,
		width: 100,
		height: 40,
	});
	$('#end_month').selectlist({
		zIndex: 10,
		width: 100,
		height: 40,
	});
	$('#end_date').selectlist({
		zIndex: 10,
		width: 100,
		height: 40,
	});
	$('#end_hour').selectlist({
		zIndex: 10,
		width: 100,
		height: 40,
	});
	$('#end_minute').selectlist({
		zIndex: 10,
		width: 100,
		height: 40,
	});
});