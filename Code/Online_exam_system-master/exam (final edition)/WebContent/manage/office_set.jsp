<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%
String userid = request.getParameter("userid");
String username = request.getParameter("username");
ArrayList<String> courseid = new ArrayList<String>();
ArrayList<String> coursename = new ArrayList<String>();
ArrayList<String> teacherid = new ArrayList<String>();
ArrayList<String> teachername = new ArrayList<String>();
String sql1="SELECT * FROM course";
DBHelper.getConnection();
ResultSet rs1 = DBHelper.Query(sql1);
while(rs1.next()){
	courseid.add(rs1.getString("courseID"));
	coursename.add(rs1.getString("name"));
}
String sql2="SELECT * FROM teacher";
ResultSet rs2 = DBHelper.Query(sql2);
while(rs2.next()){
	teacherid.add(rs2.getString("teacherID"));
	teachername.add(rs2.getString("name"));
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
<script src="js/office_set.js"></script>
</head>
<body>
	<div class="Wrapbody">
		<ul class="zla_m_tab" id="zla_title">
			<li class="zla_m_item zla_m_cur">
				<a href="#">设置临近的考试</a>
			</li>
		</ul>
		<div class="Div">
			<select id="course">
				<option value="0">请选择科目</option>
				<%
				for(int i = 0;i<courseid.size();i++){
				%>
				<option value="<%=courseid.get(i)%>"><%=coursename.get(i)%></option>
				<%
				}
				%>
			</select>
			
			<select id="teacher">
				<option value="0">请选择出题教师</option>
				<%
				
				for(int i = 0;i<teacherid.size();i++){
				%>
				<option value="<%=teacherid.get(i)%>"><%=teachername.get(i)%></option>
				<%
				}
				%>
			</select>
			<div class="block">
				<div class="aline">
					<span class="normal_one">名称</span>
					<input type="text" class="one_line" id="exam_name"></input>
				</div>
				<div class="aline">
					<div class="specail_line_four">
						<span class="normal_one">考试开始的时间</span>
						<select id="begin_year">
							<option value="0">年</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
						</select>
						<select id="begin_month">
							<option value="0">月</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<select id="begin_date">
							<option value="0">日</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<select id="begin_hour">
							<option value="0">小时</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
						</select>
						<select id="begin_minute">
							<option value="0">分钟</option>
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
						</select>
					</div>
				</div>
				<div class="aline">
					<div class="specail_line_four">
						<span class="normal_one">考试结束的时间</span>
						<select id="end_year">
							<option value="0">年</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
						</select>
						<select id="end_month">
							<option value="0">月</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
						<select id="end_date">
							<option value="0">日</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
							<option value="25">25</option>
							<option value="26">26</option>
							<option value="27">27</option>
							<option value="28">28</option>
							<option value="29">29</option>
							<option value="30">30</option>
							<option value="31">31</option>
						</select>
						<select id="end_hour">
							<option value="0">小时</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
							<option value="23">23</option>
							<option value="24">24</option>
						</select>
						<select id="end_minute">
							<option value="0">分钟</option>
							<option value="00">00</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="30">30</option>
							<option value="40">40</option>
							<option value="45">45</option>
							<option value="50">50</option>
						</select>
					</div>
				</div>
				<div class="aline">
					<button class="submit_button" id="submit">提交</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>