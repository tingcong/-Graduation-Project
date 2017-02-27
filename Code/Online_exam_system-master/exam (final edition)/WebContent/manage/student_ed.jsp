<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="XML.paperCreationRulesXmlHelper" %>
<%@ page import="Logic.staticVariable" %>
<%@ page import="Logic.timeHelper" %>
<%@ page import="Logic.getExam" %>
<%
paperCreationRulesXmlHelper ruleHelper = new paperCreationRulesXmlHelper();
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
String userid = request.getParameter("userid");
ArrayList<examinationBean> exam = new ArrayList<examinationBean>();
exam = getExam.get("student",userid,"ed","1","0");
exam.addAll(getExam.get("student",userid,"ed","1","1"));
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
				<a href="#">已经结束的考试</a>
			</li>
		</ul>
		<div class="ulDiv">
			<ul>
				<%
				for(int i = 0; i < exam.size(); i++){
					paperHelper.path = staticVariable.path + "papers/";
					String examScore = paperHelper.getPapersByProperty(new String[]{exam.get(i).getExaminationID()}, "studentID", userid, false).get(0).getFinalScore();
					String ps;
					if (examScore.equals("")){
						examScore = "等待批改";
						ps = "无";
					}
					else{
						if(Integer.valueOf(examScore)<60){
							 ps = "不及格";
						}
						else{
							ps = "无";
						}
					}
					String dateBeginStamp = exam.get(i).getDateBegin();
					String dateEndStamp = exam.get(i).getDateEnd();
					String dateBegin = timeHelper.timeStamp2Date(dateBeginStamp,"yyyy年MM月dd日 HH:mm");
					String dateEnd = timeHelper.timeStamp2Date(dateEndStamp,"yyyy年MM月dd日 HH:mm");
				%>
			 	<li>
					<div class="Mconright">							
						<h3 class="clearfix"><%=exam.get(i).getExaminationName()%></h3>
					   	<p>开始时间：<%=dateBegin%></p>
					   	<p>结束时间：<%=dateEnd%></p>
					   	<p>考试成绩：<%=examScore%></p>
						<p>特殊说明：<%=ps%></p>
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