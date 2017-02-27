<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%
String teacherID = request.getParameter("teacherID");
String courseID = request.getParameter("courseID");
ArrayList<String> courseid = new ArrayList<String>();
ArrayList<String> coursename = new ArrayList<String>();
String sql="SELECT * FROM course";
DBHelper.getConnection();
ResultSet rs = DBHelper.Query(sql);
while(rs.next()){
	courseid.add(rs.getString("courseID"));
	coursename.add(rs.getString("name"));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/manage.css" type="text/css" rel="stylesheet">
<link href="css/jquery.selectlist.css" type="text/css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.selectlist.js"></script>
<script src="js/teacher_add.js"></script>
</head>
<body>
<input type="hidden" id="teacherid" value="<%=teacherID%>">
	<div class="Wrapbody">
		<ul class="zla_m_tab" id="zla_title">
			<li class="zla_m_item zla_m_cur">
				<a href="#">添加题目到题库</a>
			</li>
		</ul>
		<div class="Div">
			<select id="course">
				<option value="0">请选择试题科目</option>
				<%
				for(int i = 0;i<courseid.size();i++){
				%>
				<option value="<%=courseid.get(i)%>"><%=coursename.get(i)%></option>
				<%
				}
				%>
			</select>
			<select id="question_type">
				<option value="0">请选择题目类型</option>
				<option value="1">单项选择</option>
				<option value="2">多项选择</option>
				<option value="3">判断正误</option>
				<option value="4">问答辨析</option>
			</select>
			<div class="block" id="single">
				<div class="aline">
					<span class="normal_one">题目</span>
					<input type="text" class="one_line" id="single_title"></input>
				</div>
				<div class="aline">
					<span class="normal_one">A</span>
					<input type="text" class="one_line" id="single_A"></input>
				</div>
				<div class="aline">
					<span class="normal_one">B</span>
					<input type="text" class="one_line" id="single_B"></input>
				</div>
				<div class="aline">
					<span class="normal_one">C</span>
					<input type="text" class="one_line" id="single_C"></input>
				</div>
				<div class="aline">
					<span class="normal_one">D</span>
					<input type="text" class="one_line" id="single_D"></input>
				</div>
				<div class="aline">
					<span class="specail_line_one">
						<select id="single_right">
							<option value="0">请选择正确答案</option>
							<option value="1">A</option>
							<option value="2">B</option>
							<option value="3">C</option>
							<option value="4">D</option>
						</select>
						<select id="single_level">
							<option value="0">请选择该题难度</option>
							<option value="1">简单</option>
							<option value="2">普通</option>
							<option value="3">困难</option>
						</select>
					</span>
					<button class="submit_button" id="single_submit">提交</button>
				</div>
			</div>
			<div class="block" id="multi">
			<div class="aline">
					<span class="normal_one">题目</span>
					<input type="text" class="one_line" id="multi_title"></input>
				</div>
				<div class="aline">
					<span class="normal_one">A</span>
					<input type="text" class="one_line" id="multi_A"></input>
				</div>
				<div class="aline">
					<span class="normal_one">B</span>
					<input type="text" class="one_line" id="multi_B"></input>
				</div>
				<div class="aline">
					<span class="normal_one">C</span>
					<input type="text" class="one_line" id="multi_C"></input>
				</div>
				<div class="aline">
					<span class="normal_one">D</span>
					<input type="text" class="one_line" id="multi_D"></input>
				</div>
				<div class="aline">
					<span class="specail_line_two">
						<span class="normal_two">请选择正确答案</span>
						<input type="checkbox" class="check" id="multi_right_A"><span class="normal_two">A</span></input>
						<input type="checkbox" class="check" id="multi_right_B"><span class="normal_two">B</span></input>
						<input type="checkbox" class="check" id="multi_right_C"><span class="normal_two">C</span></input>
						<input type="checkbox" class="check" id="multi_right_D"><span class="normal_two">D</span></input>
						<select id="multi_level">
							<option value="0">请选择该题难度</option>
							<option value="1">简单</option>
							<option value="2">普通</option>
							<option value="3">困难</option>
						</select>
					</span>
					<button class="submit_button" id="multi_submit">提交</button>
				</div>
			</div>
			<div class="block" id="judge">
				<div class="aline">
					<span class="normal_one">题目</span>
					<input type="text" class="one_line" id="judge_title"></input>
				</div>
				<div class="aline">
					<span class="specail_line_one">
						<select id="judge_right">
							<option value="0">请选择正确答案</option>
							<option value="1">T</option>
							<option value="2">F</option>
						</select>
						<select id="judge_level">
							<option value="0">请选择该题难度</option>
							<option value="1">简单</option>
							<option value="2">普通</option>
							<option value="3">困难</option>
						</select>
					</span>
					<button class="submit_button" id="judge_submit">提交</button>
				</div>
			</div>
			<div class="block" id="essay">
				<div class="aline">
					<div class="normal_three">题目</div>
					<textarea type="text" class="many_lines" id="essay_title"></textarea>
				</div>
				<div class="aline">
					<div class="normal_three">答案</div>
					<textarea type="text" class="many_lines" id="essay_right"></textarea>
				</div>
				<div class="aline">
					<span class="specail_line_three">
						<select id="essay_level">
							<option value="0">请选择该题难度</option>
							<option value="1">简单</option>
							<option value="2">普通</option>
							<option value="3">困难</option>
						</select>
					</span>
					<button class="submit_button" id="essay_submit">提交</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>