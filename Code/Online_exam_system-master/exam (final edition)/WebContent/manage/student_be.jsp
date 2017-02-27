<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.paperCreationRulesXmlHelper" %>
<%@ page import="Logic.timeHelper" %>
<%@ page import="Logic.getExam" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%
paperCreationRulesXmlHelper ruleHelper = new paperCreationRulesXmlHelper();
String userid = request.getParameter("userid");
ArrayList<examinationBean> exam = new ArrayList<examinationBean>();
exam = getExam.get("student",userid,"be","0","0");
exam.addAll(getExam.get("student",userid,"be","1","0"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/manage.css" type="text/css" rel="stylesheet">
</head>
<body>
	<div class="Wrapbody">
		<ul class="zla_m_tab" id="zla_title">
			<li class="zla_m_item zla_m_cur">
				<a href="#">即将到来的考试</a>
			</li>
		</ul>
		<div class="ulDiv">
			<ul>
				<%
				for(int i = 0; i < exam.size(); i++){
					String teacherID = exam.get(i).getTeacherID();
					ArrayList<String> teacherName = new ArrayList<String>();
					String sql="SELECT name FROM teacher WHERE teacherID='"+teacherID+"'";
					DBHelper.getConnection();
					ResultSet rs = DBHelper.Query(sql);
					while(rs.next()){
						teacherName.add(rs.getString("name"));
					}
					String ruleID = exam.get(i).getRuleID();
					String examTime;
					if (ruleID.equals("-1")){
						examTime = "待定";
					}
					else{
						examTime = ruleHelper.getRuleByID("rule", ruleID).getExamTime()+"分钟";
					}			
					String dateBeginStamp = exam.get(i).getDateBegin();
					String dateEndStamp = exam.get(i).getDateEnd();
					String dateBegin = timeHelper.timeStamp2Date(dateBeginStamp,"yyyy年MM月dd日 HH:mm");
					String dateEnd = timeHelper.timeStamp2Date(dateEndStamp,"yyyy年MM月dd日 HH:mm");
				%>
			 	<li>
					<div class="Mconright">							
						<h3 class="clearfix"><%=exam.get(i).getExaminationName()%></h3>
						<p>任课教师：<%=teacherName.get(0)%></p>
						<p>考试限时：<%=examTime%></p>
					   	<p>开始时间：<%=dateBegin%></p>
					   	<p>结束时间：<%=dateEnd%></p>	
					</div>
				</li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</body>
</html>