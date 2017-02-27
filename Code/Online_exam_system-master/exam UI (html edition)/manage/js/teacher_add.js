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
		block = $(".block"),
		single = $("#single"),
		multi = $("#multi"),
		judge = $("#judge"),
		essay = $("#essay"),
		question_type = null;

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
		var choice = $("input[name='course']").val();
		if (choice != 0){
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
		var choice = $("input[name='single_right']").val();
		if (choice != 0){
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
		var choice = $("input[name='single_level']").val();
		if (choice != 0){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		var choice = $("input[name='multi_level']").val();
		if (choice != 0){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		var choice = $("input[name='judge_right']").val();
		if (choice != 0){
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
		var choice = $("input[name='judge_level']").val();
		if (choice != 0){
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
		if ($(this).val() != ""){
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
		if ($(this).val() != ""){
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
		var choice = $("input[name='essay_level']").val();
		if (choice != 0){
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
		if ($(this).val() != ""){
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
});