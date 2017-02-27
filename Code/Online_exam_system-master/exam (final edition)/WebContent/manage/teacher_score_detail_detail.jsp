<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="XML.essayQuestionOnPaper" %>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.paperBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Logic.staticVariable" %>
<%
String examID = request.getParameter("examid");
String paperID = request.getParameter("paperid");
examArrangementXmlHelper examHelper = new examArrangementXmlHelper();
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
paperHelper.path = staticVariable.path + "papers/";
examinationBean exam = examHelper.getExaminationByID("exam", examID);
paperBean paper = paperHelper.getPaperByID(examID, paperID);
essayQuestionOnPaper essay[] = paper.getEssayQuestions();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/manage.css" type="text/css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/teacher_score.js"></script>
</head>
<body>
<input type="hidden" id="examid" value="<%=examID%>">
<input type="hidden" id="paperid" value="<%=paperID%>">
	<div class="Wrapbody">
		<ul class="zla_m_tab" id="zla_title">
			<li class="zla_m_item zla_m_cur">
				<a href="#">等待批改的试卷</a>
			</li>
		</ul>
		<div class="Div">
			<div class="normal_one"><%=exam.getExaminationID()%>主观题批改</div>
			<div class="score">
				<%
				for(int i = 1; i <= essay.length; i++){
				%>
				<div class="rightF">
					<span class="normal_one">评分</span>
					<input type="text" class="one_block" id="essay_<%=i%>_answer"></input>
				</div>
				<div class="score_title">题目</div>
				<div class="content_box">
					<div class="content"><%=i%>.<%=essay[i-1].getTitle()%></div>
				</div>
				<div class="score_title">参考答案</div>
				<div class="content_box">
					<div class="content">本题暂无参考答案</div>
				</div>
				<div class="score_title">学生答案</div>
				<div class="content_box">
					<div class="content"><%=essay[i-1].getStudentAnswer()%></div>
				</div>
				<%
				}
				%>
			</div>
			<div class="button_block">
				<button class="submit_button" id="submit">提交</button>
			</div>
		</div>
	</div>
</body>
</html>