$(function() {
	var fullscreen_time = 0,
		alter_time = 0,
		check_no = 0,
		time = holetime = 60;
		interval_id = window.setInterval("showtime()",60000);
	$("#time").html(time);
	$(".quit_btn").hide();
	window.showtime = function(){
		time -= 1;
		$("#time").html(time);
		if (time <= parseInt(holetime/2)){
			$("#time").addClass("force_red");
		}
		if (time == 0){
			$('.alert_msg').html('考试结束，系统已自动帮你提交试卷！');
			$('.alert_btn').hide();
			$(".quit_btn").show();
			$(".alert_screen").show();
			interval_id = window.clearInterval(interval_id);
		}
	}
	function requestFullScreen() {
		var de = document.documentElement;
		if (de.requestFullscreen) {
			de.requestFullscreen();
		} else if (de.mozRequestFullScreen) {
			de.mozRequestFullScreen();
		} else if (de.webkitRequestFullScreen) {
			de.webkitRequestFullScreen();
		} else if(de.msRequestFullscreen) {
			de.msRequestFullscreen();
		}
	}
	// function exitFullscreen() {
	// 	var de = document;
	// 	if (de.exitFullscreen) {
	// 		de.exitFullscreen();
	// 	} else if (de.mozCancelFullScreen) {
	// 		de.mozCancelFullScreen();
	// 	} else if (de.webkitCancelFullScreen) {
	// 		de.webkitCancelFullScreen();
	// 	} else if(de.msCancelFullscreen) {
	// 		de.msCancelFullscreen();
	// 	}
	// }
	window.onresize = function (){
	    if(window.outerHeight === screen.height && window.outerWidth === screen.width) {
	    	fullscreen_time += 1;
	    } else {
	        $(".alert_screen").show();
	    }
	}
	window.onblur = function (){
		if(fullscreen_time > 0 && fullscreen_time <= 2){
			$(".alert_screen").show();
			$('.alert_msg').addClass('force_red');
			$('.alert_msg').html('还敢偷偷切换窗口，你已经挂了！');
			$('.alert_btn').hide();
			$(".quit_btn").show();
		}
	}
	document.addEventListener('visibilitychange', function() {
	    if (document.hidden) {
	        alter_time += 1;
	    }
	    if (alter_time > 0 && fullscreen_time > 0 && fullscreen_time <= 2) {
	    	$(".alert_screen").show();
			$('.alert_msg').addClass('force_red');
			$('.alert_msg').html('还敢偷偷切换窗口，你已经挂了！');
			$('.alert_btn').hide();
			$(".quit_btn").show();
	    }
	});
	$('.single_choice').selectlist({
		zIndex: 100,
		width: 150,
		height: 40,
	});
	$('.judge_choice').selectlist({
		zIndex: 100,
		width: 150,
		height: 40,
	});
	$(".single_choice ul li").on('click',function(){
		var choice_id = $(this).closest(".single_choice").attr("id");
		var choice = $("input[name='" + choice_id + "']").val();
		var id_no=choice_id.replace(/[^0-9]/ig,""); 
		if (choice != 0){
			$("#single_" + id_no + "_mark").addClass("active");
			console.log($(".single_mark_list li.active").length);
			if ($(".single_mark_list li.active").length == $(".single_mark_list li").length) {
				$("#single_mark").addClass("active");
			}
		}
		else{
			$("#single_" + id_no + "_mark").removeClass("active");
			$("#single_mark").removeClass("active");
		}
	});
	$(".check").on('change',function() {
		var check_id = $(this).attr("id");
		var id_no=check_id.replace(/[^0-9]/ig,"");
		if($("#multi_" + id_no + " :input[type='checkbox']:checked").length > 1){
			$("#multi_" + id_no + "_mark").addClass("active");
		}
		else {
			$("#multi_" + id_no + "_mark").removeClass("active");
			$("#multi_mark").removeClass("active");
		}
		if ($(".single_mark_list li.active").length == $(".single_mark_list li").length) {
			$("#multi_mark").addClass("active");
		}
		if ($("#" + check_id).prop("checked")){	
		}
		else {
		}
	});
	$(".judge_choice ul li").on('click',function(){
		var choice_id = $(this).closest(".judge_choice").attr("id");
		var choice = $("input[name='" + choice_id + "']").val();
		var id_no=choice_id.replace(/[^0-9]/ig,""); 
		if (choice != 0){
			$("#judge_" + id_no + "_mark").addClass("active");
			console.log($(".judge_mark_list li.active").length);
			if ($(".judge_mark_list li.active").length === $(".judge_mark_list li").length) {
				$("#judge_mark").addClass("active");
			}
		}
		else{
			$("#judge_" + id_no + "_mark").removeClass("active");
			$("#judge_mark").removeClass("active");
		}
	});
	$(".exam_many_lines").on('change',function() {
		var essay_id = $(this).attr("id");
		var id_no = essay_id.replace(/[^0-9]/ig,"");
		if ($(this).val() != ""){
			$("#essay_" + id_no + "_mark").addClass("active");
		}
		else {
			$("#essay_" + id_no + "_mark").removeClass("active");
		}
	});
	$('.alert_btn').on('click',function () {
		console.log(fullscreen_time);
		$('.alert_msg').addClass('force_red');
		if(fullscreen_time<2) {
			$('.alert_msg').html('警告：请马上返回全屏模式!');
			$('.alert_btn').html('返回全屏');
		} else {
			$('.alert_msg').html('由于你无视警告，多次退出全屏模式，构成作弊，该场考试成绩为0！');
			$('.alert_btn').hide();
			$(".quit_btn").show();
		}
		requestFullScreen();
		$(".alert_screen").hide();
	});

});