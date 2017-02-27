$(function() {
	var course = 0,
		teacher = 0,
		exam_name = 0,
		begin_year = 0,
		begin_month = 0,
		begin_date = 0,
		begin_hour = 0,
		begin_minute = 0,
		end_year = 0,
		end_month = 0,
		end_date = 0,
		end_hour = 0,
		end_minute = 0,
		Vcourse = null,
		Vteacher = null,
		Vexam_name = null,
		Vbegin_year = null,
		Vbegin_month = null,
		Vbegin_date = null,
		Vbegin_hour = null,
		Vbegin_minute = null,
		Vend_year = null,
		Vend_month = null,
		Vend_date = null,
		Vend_hour = null,
		Vend_minute = null;
	$('#course').selectlist({
		zIndex: 12,
		width: 300,
		height: 40,
	});
	$('#teacher').selectlist({
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
	$('#submit').attr("disabled",true);
	$("#course ul li").on('click',function(){
		Vcourse = $("input[name='course']").val();
		if (Vcourse != 0){
			course = 1;
		}
		else{
			course = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#teacher ul li").on('click',function(){
		Vteacher = $("input[name='teacher']").val();
		if (Vteacher != 0){
			teacher = 1;
		}
		else{
			teacher = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#exam_name").on('change',function() {
		Vexam_name = $(this).val();
		if (Vexam_name != ""){
			exam_name = 1;
		}
		else {
			exam_name = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#begin_year ul li").on('click',function(){
		Vbegin_year = $("input[name='begin_year']").val();
		if (Vbegin_year != 0){
			begin_year = 1;
		}
		else{
			begin_year = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#begin_month ul li").on('click',function(){
		Vbegin_month = $("input[name='begin_month']").val();
		if (Vbegin_month != 0){
			begin_month = 1;
		}
		else{
			begin_month = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#begin_date ul li").on('click',function(){
		Vbegin_date = $("input[name='begin_date']").val();
		if (Vbegin_date != 0){
			begin_date = 1;
		}
		else{
			begin_date = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#begin_hour ul li").on('click',function(){
		Vbegin_hour = $("input[name='begin_hour']").val();
		if (Vbegin_hour != 0){
			begin_hour = 1;
		}
		else{
			begin_hour = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#begin_minute ul li").on('click',function(){
		Vbegin_minute = $("input[name='begin_minute']").val();
		if (Vbegin_minute != 0){
			begin_minute = 1;
		}
		else{
			begin_minute = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#end_year ul li").on('click',function(){
		Vend_year = $("input[name='end_year']").val();
		if (Vend_year!= 0){
			end_year = 1;
		}
		else{
			end_year = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#end_month ul li").on('click',function(){
		Vend_month = $("input[name='end_month']").val();
		if (Vend_month != 0){
			end_month = 1;
		}
		else{
			end_month = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#end_date ul li").on('click',function(){
		Vend_date = $("input[name='end_date']").val();
		if (Vend_date != 0){
			end_date = 1;
		}
		else{
			end_date = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#end_hour ul li").on('click',function(){
		Vend_hour = $("input[name='end_hour']").val();
		if (Vend_hour != 0){
			end_hour = 1;
		}
		else{
			end_hour = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#end_minute ul li").on('click',function(){
		Vend_minute = $("input[name='end_minute']").val();
		if (Vend_minute != 0){
			end_minute = 1;
		}
		else{
			end_minute = 0;
		}
		if (course === 1 && teacher === 1 && exam_name === 1 && begin_year === 1 && begin_month === 1 && begin_date === 1 && begin_hour === 1 && begin_minute === 1 && end_year === 1 && end_month === 1 && end_date === 1 && end_hour === 1 && end_minute === 1){
			$('#submit').attr("disabled",false);
		}
		else {
			$('#submit').attr("disabled",true);
		}
	});
	$("#submit").on('click',function(){
		var date_begin = Vbegin_year + "-" + Vbegin_month + "-" + Vbegin_date + " " + Vbegin_hour + ":" + Vbegin_minute + ":00";
		var date_end = Vend_year + "-" + Vend_month + "-" + Vend_date + " " + Vend_hour + ":" + Vend_minute + ":00";
		$.ajax({
			method: 'GET',
			url: '../handle/officeSet.jsp',
			dateType: 'json',
			data: {
				courseID:Vcourse,
				teacherID:Vteacher,
				examName:Vexam_name,
				dateBeginString:date_begin,
				dateEndString:date_end
			},
			success:function() {
				location.reload();
			}
		});
	});
});