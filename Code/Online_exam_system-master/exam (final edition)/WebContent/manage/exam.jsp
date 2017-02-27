<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="XML.paperCreationRulesXmlHelper" %>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.singleChoiceBankXmlHelper" %>
<%@ page import="XML.multipleChoiceBankXmlHelper" %>
<%@ page import="XML.judgementBankXmlHelper" %>
<%@ page import="XML.essayQuestionBankXmlHelper" %>
<%@ page import="XML.singleChoiceQuestionOnPaper" %>
<%@ page import="XML.multipleChoiceQuestionOnPaper" %>
<%@ page import="XML.judgementQuestionOnPaper" %>
<%@ page import="XML.essayQuestionOnPaper" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="XML.paperBean" %>
<%@ page import="Logic.staticVariable" %>
<%
String examID = request.getParameter("examid");
String examName = request.getParameter("examname");
String studentID = request.getParameter("studentid");
String studentName = request.getParameter("studentname");
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
paperHelper.path = staticVariable.path + "papers/";
paperBean paper = paperHelper.getPapersByProperty(new String[]{examID}, "studentID", studentID, false).get(0);
String examTime = paper.getExamTime();
String usedTime = paper.getUsedTime();
singleChoiceQuestionOnPaper single[] = paper.getSingleChoiceQuestions();
multipleChoiceQuestionOnPaper multi[] = paper.getMultipleChoiceQuestions();
judgementQuestionOnPaper judge[] = paper.getJudgmentQuestions();
essayQuestionOnPaper essay[] = paper.getEssayQuestions();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">	
<title>在线考试系统</title>
<link href="css/manage.css" type="text/css" rel="stylesheet">
<link href="css/jquery.selectlist.css" type="text/css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<script src="js/jquery.selectlist.js"></script>
<script src="js/exam.js"></script>
</head>
<body> 
<header>
<input type="hidden" id="examid" value="<%=examID%>">
<input type="hidden" id="paperid" value="<%=paper.getPaperID()%>">
<input type="hidden" id="used_time" value="<%=usedTime%>">
<div id="exam_top">
	<div class="leftF">
		<span class="exam_head"><%=examName%></span>
	</div>
	<div class="rightF">
		<span class="exam_head">学号：<%=studentID%></span>
		<span class="exam_head">姓名：<%=studentName%></span>
	</div>
	<div class="center">
		<span class="exam_head" id="hole_time">考试限时：<%=examTime%>分钟</span>
		<span class="exam_head">剩余时间：<span class="green" id="time"></span>分钟</span>
	</div>
</div>
</header>
<div class="main">
	<div class="marklist rightF">
		<ul class="single_mark_list">
		<%
		if (single.length!=0){
		%>
			<div class="mark_title" id="single_mark">
				<a href="#single_title" class="mark"><ul>单项选择</ul></a>
			</div>	
		<%
			for(int i=1;i<=single.length;i++){
		%>
			<li id="single_<%=i%>_mark">
				<a href="#single_<%=i%>" class="mark"><ul><%=i%></ul></a>
			</li>
		<%
			}
		}
		%>
		</ul>
		<ul class="multi_mark_list">
		<%
		if (multi.length!=0){
		%>
			<div class="mark_title" id="multi_mark">
				<a href="#multi_title" class="mark"><ul>多项选择</ul></a>
			</div>	
		<%
			for(int i=1;i<=multi.length;i++){
		%>
			<li id="multi_<%=i%>_mark">
				<a href="#multi_<%=i%>" class="mark"><ul><%=i%></ul></a>
			</li>
		<%
			}
		}
		%>
		</ul>
		<ul class="judge_mark_list">
		<%
		if (judge.length!=0){
		%>
			<div class="mark_title" id="judge_mark">
				<a href="#judge_title" class="mark"><ul>判断正误</ul></a>
			</div>	
		<%
			for(int i=1;i<=judge.length;i++){
		%>
			<li id="judge_<%=i%>_mark">
				<a href="#judge_<%=i%>" class="mark"><ul><%=i%></ul></a>
			</li>
		<%
			}
		}
		%>
		</ul>
		<ul class="essay_mark_list">
			<%
		if (essay.length!=0){
		%>
			<div class="mark_title" id="essay_mark">
				<a href="#essay_title" class="mark"><ul>问答辨析</ul></a>
			</div>	
		<%
			for(int i=1;i<=essay.length;i++){
		%>
			<li id="essay_<%=i%>_mark">
				<a href="#essay_<%=i%>" class="mark"><ul><%=i%></ul></a>
			</li>
		<%
			}
		}
		%>
			<div class="submit_paper">
				<a href="#" class="mark" id="submit"><ul>提交试卷</ul></a>
			</div>
		</ul>
	</div>
	<div class="blocker"></div>
	<div class="examright leftF">
		<div class="block" id="single_block">
		<%
		if (single.length!=0){
		%>
			<div class="title" id="single_title">一、单项选择</div>
		<%
			for(int i=1;i<=single.length;i++){
		%>
			<div class="content_box" id="single_<%=i%>">
				<select class="single_choice rightF" id="single_<%=i%>_choice">
					<option value="0">请选择正确答案</option>
					<option value="1">A</option>
					<option value="2">B</option>
					<option value="3">C</option>
					<option value="4">D</option>
				</select>
				<div class="content" id="single_<%=i%>_title"><%=i%>.<%=single[i-1].getTitle()%></div>
				<div class="choice_box">
					<div class="content" id="single_<%=i%>_A">A.<%=single[i-1].getChoices()[0]%></div>
					<div class="content" id="single_<%=i%>_B">B.<%=single[i-1].getChoices()[1]%></div>
					<div class="content" id="single_<%=i%>_C">C.<%=single[i-1].getChoices()[2]%></div>
					<div class="content" id="single_<%=i%>_D">D.<%=single[i-1].getChoices()[3]%></div>
				</div>
			</div>
		<%
			}
		}
		%>
		</div>
		<div class="block" id="multi_block">
		<%
		if (multi.length!=0){
		%>
			<div class="title" id="multi_title">二、多项选择</div>
		<%
			for(int i=1;i<=multi.length;i++){
		%>
			<div class="content_box" id="multi_<%=i%>">
				<div class="content" id="multi_<%=i%>_title"><%=i%>.<%=multi[i-1].getTitle()%></div>
				<div class="choice_box">
					<div class="content">
						<input type="checkbox" class="check" id="multi_<%=i%>_choice_A"><span id="multi_<%=i%>_A">A.<%=multi[i-1].getChoices()[0]%></span></input>
					</div>
					<div class="content">
						<input type="checkbox" class="check" id="multi_<%=i%>_choice_B"><span id="multi_<%=i%>_B">B.<%=multi[i-1].getChoices()[0]%></span></input>
					</div>
					<div class="content">
						<input type="checkbox" class="check" id="multi_<%=i%>_choice_C"><span id="multi_<%=i%>_C">C.<%=multi[i-1].getChoices()[0]%></span></input>
					</div>
					<div class="content">
						<input type="checkbox" class="check" id="multi_<%=i%>_choice_D"><span id="multi_<%=i%>_D">D.<%=multi[i-1].getChoices()[0]%></span></input>
					</div>
				</div>
			</div>
		<%
			}
		}
		%>	
		</div>
		<div class="block" id="judge_block">
		<%
		if (judge.length!=0){
		%>
			<div class="title" id="judge_title">三、判断正误</div>
		<%
			for(int i=1;i<=judge.length;i++){
		%>
			<div class="content_box" id="judge_<%=i%>">
				<select class="judge_choice rightF" id="judge_<%=i%>_choice">
					<option value="0">请选择正确答案</option>
					<option value="1">T</option>
					<option value="2">F</option>
				</select>
				<div class="content" id="judge_<%=i%>_title"><%=i%>.<%=judge[i-1].getTitle()%></div>
			</div>
		<%
			}
		}
		%>
		</div>
		<div class="block" id="essay_block">
		<%
		if (essay.length!=0){
		%>
			<div class="title" id="essay_title">四、简答辨析</div>
		<%
			for(int i=1;i<=essay.length;i++){
		%>
			<div class="content_box" id="essay_<%=i%>">
				<div class="content" id="essay_<%=i%>_title"><%=i%>.<%=essay[i-1].getTitle()%></div>
				<textarea type="text" class="exam_many_lines" id="essay_<%=i%>_answer"></textarea>
			</div>
		<%
			}
		}
		%>
		</div>
	</div>
</div>
<div class="clear"></div>
<div class="exam_foot">
	<span>Copyright © Jackeriss, Franky Shy</span>
</div>
<div class="alert_screen">
	<div class="alert_block">
		<div class="alert_msg">注意：考试过程中请不要退出全屏，更不能切换，否则按作弊处理！</div>
		<button class="alert_btn submit_button">开始考试</button>
		<a href="../index.jsp"><button class="quit_btn submit_button">退出考试</button></a>
	</div>
</div>
</body>
</html>