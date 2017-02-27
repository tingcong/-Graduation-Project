<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.paperBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%@ page import="Logic.staticVariable" %>
<%
String examID = request.getParameter("examid");
examArrangementXmlHelper examHelper = new examArrangementXmlHelper();
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
examinationBean exam = examHelper.getExaminationByID("exam", examID);
ArrayList<String> studentid = new ArrayList<String>();
ArrayList<String> studentname = new ArrayList<String>();
String sql="SELECT studentID,name FROM student";
DBHelper.getConnection();
ResultSet rs = DBHelper.Query(sql);
while(rs.next()){
	studentid.add(rs.getString("studentID"));
	studentname.add(rs.getString("name"));
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/manage.css" type="text/css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/teacher_score_detail.js"></script>
</head>
<body>
<input type="hidden" id="examid" value="<%=examID%>">
	<div class="Wrapbody">
		<ul class="zla_m_tab" id="zla_title">
			<li class="zla_m_item zla_m_cur">
				<a href="#">等待批改的试卷</a>
			</li>
		</ul>
		<div class="Div">
			<div class="normal_one"><%=exam.getExaminationName()%></div>
			<div class="block">
				<div class="four_in_one">
					<div class="normal_one">总成绩</div>
				</div>
				<div class="four_in_one">
					<div class="normal_one">客观题成绩</div>
				</div>
				<div class="four_in_one">
					<div class="normal_one">姓名</div>
				</div>
				<div class="four_in_one">
					<div class="normal_one">序号</div>
				</div>
				<%
				for(int i = 0; i < studentid.size(); i++){
					paperHelper.path = staticVariable.path + "papers/";
					paperBean paper = paperHelper.getPapersByProperty(new String[]{examID}, "studentID", studentid.get(i), false).get(0);
					String score;
					int havent = 0;
					if(paper.getFinalScore().equals("")){
						havent += 1;
						score = "待批改";
					}
					else{
						score = paper.getFinalScore();
					}
				%>
				<input type="hidden" id="havent" value="<%=havent%>">
				<a href="teacher_score_detail_detail.jsp?examid=<%=examID%>&paperid=<%=paper.getPaperID()%>">
					<div class="four_in_one">
						<div class="normal_one"><%=score%></div>
					</div>
					<div class="four_in_one">
						<div class="normal_one"><%=paper.getObjectiveScore()%></div>
					</div>
					<div class="four_in_one">
						<div class="normal_one"><%=studentname.get(i)%></div>
					</div>
					<div class="four_in_one">
						<div class="normal_one"><%=i+1%></div>
					</div>
				</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>