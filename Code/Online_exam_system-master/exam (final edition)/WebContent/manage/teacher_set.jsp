<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="Logic.timeHelper" %>
<%@ page import="Logic.getExam" %>
<%
String userid = request.getParameter("userid");
ArrayList<examinationBean> exam = new ArrayList<examinationBean>();
exam = getExam.get("teacher",userid,"be","0","0");
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
				<a href="#">等待设置的考试</a>
			</li>
		</ul>
		<div class="ulDiv">
			<ul>
				<%
				for(int i = 0; i < exam.size(); i++){
					String dateBeginStamp = exam.get(i).getDateBegin();
					String dateEndStamp = exam.get(i).getDateEnd();
					String dateBegin = timeHelper.timeStamp2Date(dateBeginStamp,"yyyy年MM月dd日 HH:mm");
					String dateEnd = timeHelper.timeStamp2Date(dateEndStamp,"yyyy年MM月dd日 HH:mm");
				%>
			 	<li>
			 		<a href="teacher_set_detail.jsp?examid=<%=exam.get(i).getExaminationID()%>">
						<div class="Mconright">							
							<h3 class="clearfix"><%=exam.get(i).getExaminationName()%></h3>
							<br><br>
						   	<p>开始时间：<%=dateBegin%></p>
						   	<p>结束时间：<%=dateEnd%></p>	
						</div>
					</a>
				</li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</body>
</html>