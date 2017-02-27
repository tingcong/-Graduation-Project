$(function() {
	var course = 0,
		single_right = 0,
		single_level = 0,
		single_title = 0,
		single_A = 0,
		single_B = 0,
		single_C = 0,
		single_D = 0,
		multi_right = 0,
		multi_level = 0,
		multi_title = 0,
		multi_A = 0,
		multi_B = 0,
		multi_C = 0,
		multi_D = 0,
		judge_right = 0,
		judge_level = 0,
		judge_title = 0,
		essay_right = 0,
		essay_level = 0,
		essay_title = 0,
		Vcourse = null,
		Vsingle_right = null,
		Vsingle_level = null,
		Vsingle_title = null,
		Vsingle_A = null,
		Vsingle_B = null,
		Vsingle_C = null,
		Vsingle_D = null,
		Vmulti_level = null,
		Vmulti_title = null,
		Vmulti_A = null,
		Vmulti_B = null,
		Vmulti_C = null,
		Vmulti_D = null,
		Vmulti_right_A = null,
		Vmulti_right_B = null,
		Vmulti_right_C = null,
		Vmulti_right_D = null,
		Vjudge_right = null,
		Vjudge_level = null,
		Vjudge_title = null,
		Vessay_right = null,
		Vessay_level = null,
		Vessay_title = null,
		block = $(".block"),
		single = $("#single"),
		multi = $("#multi"),
		judge = $("#judge"),
		essay = $("#essay"),
		question_type = null,
		teacherid = $("#teacherid").val();

	$('#course').selectlist({
		zIndex: 11,
		width: 300,
		height: 40,
	});
	$('#question_type').selectlist({
		zIndex: 11,
		width: 300,
		height: 40,
	});
	$('#single_right').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	$('#single_level').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	$('#multi_level').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	$('#judge_right').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	$('#judge_level').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	$('#essay_level').selectlist({
		zIndex: 10,
		width: 200,
		height: 40,
	});
	block.hide();
	$('.submit_button').attr("disabled",true);
	question_type = $("input[name='question_type']").val();
	$("#question_type ul li").on('click',function(){
		question_type = $("input[name='question_type']").val();
		if (question_type === "0"){
			block.hide();
		}
		else if (question_type === "1"){
			block.hide();
			single.show();
		}
		else if (question_type === "2"){
			block.hide();
			multi.show();
		}
		else if (question_type === "3"){
			block.hide();
			judge.show();
		}
		else if (question_type === "4"){
			block.hide();
			essay.show();
		}
	});
	$("#course ul li").on('click',function(){
		Vcourse = $("input[name='course']").val();
		if (Vcourse != 0){
			course = 1;
		}
		else{
			course = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
		if (course == 1 && judge_right == 1 && judge_level == 1 && judge_title == 1){
			$('#judge_submit').attr("disabled",false);
		}
		else {
			$('#judge_submit').attr("disabled",true);
		}
		if (course == 1 && essay_right == 1 && essay_level == 1 && essay_title == 1){
			$('#essay_submit').attr("disabled",false);
		}
		else {
			$('#essay_submit').attr("disabled",true);
		}
	});
	$("#single_right ul li").on('click',function(){
		Vsingle_right = $("input[name='single_right']").val();
		if (Vsingle_right != 0){
			single_right = 1;
		}
		else{
			single_right = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_level ul li").on('click',function(){
		Vsingle_level = $("input[name='single_level']").val();
		if (Vsingle_level != 0){
			single_level = 1;
		}
		else{
			single_level = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_title").on('change',function() {
		Vsingle_title = $(this).val();
		if (Vsingle_title != ""){
			single_title = 1;
		}
		else {
			single_title = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_A").on('change',function() {
		Vsingle_A = $(this).val();
		if (Vsingle_A != ""){
			single_A = 1;
		}
		else {
			single_A = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_B").on('change',function() {
		Vsingle_B = $(this).val();
		if (Vsingle_B != ""){
			single_B = 1;
		}
		else {
			single_B = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_C").on('change',function() {
		Vsingle_C = $(this).val();
		if (Vsingle_C != ""){
			single_C = 1;
		}
		else {
			single_C = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$("#single_D").on('change',function() {
		Vsingle_D = $(this).val();
		if (Vsingle_D != ""){
			single_D = 1;
		}
		else {
			single_D = 0;
		}
		if (course == 1 && single_right == 1 && single_level == 1 && single_title == 1 && single_A == 1 && single_B == 1 && single_C == 1 && single_D == 1){
			$('#single_submit').attr("disabled",false);
		}
		else {
			$('#single_submit').attr("disabled",true);
		}
	});
	$(".check").on('change',function() {
		if($("input[type='checkbox']:checked").length > 1){
			multi_right = 1;
		}
		else {
			multi_right = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_level ul li").on('click',function(){
		Vmulti_level = $("input[name='multi_level']").val();
		if (Vmulti_level != 0){
			multi_level = 1;
		}
		else{
			multi_level = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_title").on('change',function() {
		Vmulti_title = $(this).val();
		if (Vmulti_title != ""){
			multi_title = 1;
		}
		else {
			multi_title = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_A").on('change',function() {
		Vmulti_A = $(this).val();
		if (Vmulti_A != ""){
			multi_A = 1;
		}
		else {
			multi_A = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_B").on('change',function() {
		Vmulti_B = $(this).val();
		if (Vmulti_B != ""){
			multi_B = 1;
		}
		else {
			multi_B = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_C").on('change',function() {
		Vmulti_C = $(this).val();
		if (Vmulti_C != ""){
			multi_C = 1;
		}
		else {
			multi_C = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#multi_D").on('change',function() {
		Vmulti_D = $(this).val();
		if (Vmulti_D != ""){
			multi_D = 1;
		}
		else {
			multi_D = 0;
		}
		if (course == 1 && multi_right == 1 && multi_level == 1 && multi_title == 1 && multi_A == 1 && multi_B == 1 && multi_C == 1 && multi_D == 1){
			$('#multi_submit').attr("disabled",false);
		}
		else {
			$('#multi_submit').attr("disabled",true);
		}
	});
	$("#judge_right ul li").on('click',function(){
		Vjudge_right = $("input[name='judge_right']").val();
		if (Vjudge_right != 0){
			judge_right = 1;
		}
		else{
			judge_right = 0;
		}
		if (course == 1 && judge_right == 1 && judge_level == 1 && judge_title == 1){
			$('#judge_submit').attr("disabled",false);
		}
		else {
			$('#judge_submit').attr("disabled",true);
		}
	});
	$("#judge_level ul li").on('click',function(){
		Vjudge_level = $("input[name='judge_level']").val();
		if (Vjudge_level != 0){
			judge_level = 1;
		}
		else{
			judge_level = 0;
		}
		if (course == 1 && judge_right == 1 && judge_level == 1 && judge_title == 1){
			$('#judge_submit').attr("disabled",false);
		}
		else {
			$('#judge_submit').attr("disabled",true);
		}
	});
	$("#judge_title").on('change',function() {
		Vjudge_title = $(this).val();
		if (Vjudge_title != ""){
			judge_title = 1;
		}
		else {
			judge_title = 0;
		}
		if (course == 1 && judge_right == 1 && judge_level == 1 && judge_title == 1){
			$('#judge_submit').attr("disabled",false);
		}
		else {
			$('#judge_submit').attr("disabled",true);
		}
	});
	$("#essay_right").on('change',function() {
		Vessay_right = $(this).val();
		if (Vessay_right != ""){
			essay_right = 1;
		}
		else {
			essay_right = 0;
		}
		if (course == 1 && essay_right == 1 && essay_level == 1 && essay_title == 1){
			$('#essay_submit').attr("disabled",false);
		}
		else {
			$('#essay_submit').attr("disabled",true);
		}
	});
	$("#essay_level ul li").on('click',function(){
		Vessay_level = $("input[name='essay_level']").val();
		if (Vessay_level != 0){
			essay_level = 1;
		}
		else{
			essay_level = 0;
		}
		if (course == 1 && essay_right == 1 && essay_level == 1 && essay_title == 1){
			$('#essay_submit').attr("disabled",false);
		}
		else {
			$('#essay_submit').attr("disabled",true);
		}
	});
	$("#essay_title").on('change',function() {
		Vessay_title = $(this).val();
		if (Vessay_title != ""){
			essay_title = 1;
		}
		else {
			essay_title = 0;
		}
		if (course == 1 && essay_right == 1 && essay_level == 1 && essay_title == 1){
			$('#essay_submit').attr("disabled",false);
		}
		else {
			$('#essay_submit').attr("disabled",true);
		}
	});
	$("#single_submit").on('click',function(){
		$.ajax({
			method: 'GET',
			url: '../handle/addSingle.jsp',
			dateType: 'json',
			data: {
				courseID:Vcourse,
				teacherID:teacherid,
				level:Vsingle_level,
				title:Vsingle_title,
				choiceA:Vsingle_A,
				choiceB:Vsingle_B,
				choiceC:Vsingle_C,
				choiceD:Vsingle_D,
				rightChoice:Vsingle_right
			},	
		});
		location.reload();
	});
	$("#multi_submit").on('click',function(){
		if ($("#multi_right_A").prop("checked")){
			Vmulti_right_A = 1;
		}
		else {
			Vmulti_right_A = 0;
		}
		if ($("#multi_right_B").prop("checked")){
			Vmulti_right_B = 1;
		}
		else {
			Vmulti_right_B = 0;
		}
		if ($("#multi_right_C").prop("checked")){
			Vmulti_right_C = 1;
		}
		else {
			Vmulti_right_C = 0;
		}
		if ($("#multi_right_D").prop("checked")){
			Vmulti_right_D = 1;
		}
		else {
			Vmulti_right_D = 0;
		}
		$.ajax({
			method: 'GET',
			url: '../handle/addMulti.jsp',
			dateType: 'json',
			data: {
				courseID:Vcourse,
				teacherID:teacherid,
				level:Vmulti_level,
				title:Vmulti_title,
				choiceA:Vmulti_A,
				choiceB:Vmulti_B,
				choiceC:Vmulti_C,
				choiceD:Vmulti_D,
				rightA:Vmulti_right_A,
				rightB:Vmulti_right_B,
				rightC:Vmulti_right_C,
				rightD:Vmulti_right_D
			},	
		});
		location.reload();
	});
	$("#judge_submit").on('click',function(){
		$.ajax({
			method: 'GET',
			url: '../handle/addJudge.jsp',
			dateType: 'json',
			data: {
				courseID:Vcourse,
				teacherID:teacherid,
				level:Vjudge_level,
				title:Vjudge_title,
				rightChoice:Vjudge_right
			},	
		});
		location.reload();
	});
	$("#essay_submit").on('click',function(){
		$.ajax({
			method: 'GET',
			url: '../handle/addEssay.jsp',
			dateType: 'json',
			data: {
				courseID:Vcourse,
				teacherID:teacherid,
				level:Vessay_level,
				title:Vessay_title,
				right:Vessay_right
			},
			success:function() {
				location.reload();
			},
		});
	});
});