$(function() {
	var time = 0,
		level = 0,
		sn = 0,
		sp = 0,
		st = 0,
		mn = 0,
		mp = 0,
		mt = 0,
		jn = 0,
		jp = 0,
		jt = 0,
		en = 0,
		ep = 0,
		et = 0;
		t = 0;
	$('#set_submit').attr("disabled",true);
	$('#time').selectlist({
		zIndex: 11,
		width: 300,
		height: 40,
	});
	$('#level').selectlist({
		zIndex: 11,
		width: 300,
		height: 40,
	});
	$("#time ul li").on('click',function(){
		var choice = $("input[name='time']").val();
		if (choice != 0){
			time = 1;
		}
		else{
			time = 0;
		}
		if (time == 1 && level == 1 && t > 0){
			$('#set_submit').attr("disabled",false);
		}
		else {
			$('#set_submit').attr("disabled",true);
		}
	});
	$("#level ul li").on('click',function(){
		var choice = $("input[name='level']").val();
		if (choice != 0){
			level = 1;
		}
		else{
			level = 0;
		}
		if (time == 1 && level == 1 && t > 0){
			$('#set_submit').attr("disabled",false);
		}
		else {
			$('#set_submit').attr("disabled",true);
		}
	});
	$('.one_block').on('change',function(){
		var self = $(this),
			id = self.attr("id");
		if (id == "single_no"){
			sn = self.val();
		}
		else if (id == "single_po"){
			sp = self.val();
		}
		else if (id == "multi_no"){
			mn = self.val();
		}
		else if (id == "multi_po"){
			mp = self.val();
		}
		else if (id == "judge_no"){
			jn = self.val();
		}
		else if (id == "judge_po"){
			jp = self.val();
		}
		else if (id == "essay_no"){
			en = self.val();
		}
		else if (id == "essay_po"){
			ep = self.val();
		}
		st = sn * sp;
		mt = mn * mp;
		jt = jn * jp;
		et = en * ep;
		t = st + mt + jt + et;
		if (t == 100) {
			$('#total').addClass("force_green");
		}
		else {
			$('#total').removeClass("force_green");
		}
		$('#single_total').html(st);
		$('#multi_total').html(mt);
		$('#judge_total').html(jt);
		$('#essay_total').html(et);
		$('#total').html(t);
		if (time == 1 && level == 1 && t > 0){
			$('#set_submit').attr("disabled",false);
		}
		else {
			$('#set_submit').attr("disabled",true);
		}
	});
});