<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="XML.singleChoiceBankXmlHelper" %>
<%@ page import="XML.multipleChoiceBankXmlHelper" %>
<%@ page import="XML.judgementBankXmlHelper" %>
<%@ page import="XML.essayQuestionBankXmlHelper" %>
<%@ page import="XML.singleChoiceQuestionOnPaper" %>
<%@ page import="XML.multipleChoiceQuestionOnPaper" %>
<%@ page import="XML.judgementQuestionOnPaper" %>
<%@ page import="XML.essayQuestionOnPaper" %>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.paperCreationRulesXmlHelper" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.paperBean" %>
<%@ page import="Logic.staticVariable" %>
<%
String type = request.getParameter("type");
String examID = request.getParameter("examID");
String paperID = request.getParameter("paperID");
examArrangementXmlHelper examHelper = new examArrangementXmlHelper();
paperCreationRulesXmlHelper ruleHelper = new paperCreationRulesXmlHelper();
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
examinationBean exam = examHelper.getExaminationByID("exam", examID);
paperHelper.path = staticVariable.path + "papers/";
paperBean paper = paperHelper.getPaperByID(examID, paperID);
String teacherID = paper.getTeacherID();
String courseID = exam.getCourseID();
if (type.equals("objective")){
	int objectiveScore = 0;
	int singleScore = 0;
	int multiScore = 0;
	int judgeScore = 0;
	singleChoiceQuestionOnPaper single[] = paper.getSingleChoiceQuestions();
	multipleChoiceQuestionOnPaper multi[] = paper.getMultipleChoiceQuestions();
	judgementQuestionOnPaper judge[] = paper.getJudgmentQuestions();
	for(int i = 0; i < single.length; i++){
		if(!single[i].getScore().equals("")){
			singleScore += Integer.valueOf(single[i].getScore());
		}
	}
	for(int i = 0; i < multi.length; i++){
		if(!multi[i].getScore().equals("")){
			multiScore += Integer.valueOf(multi[i].getScore());
		}
	}
	for(int i = 0; i < judge.length; i++){
		if(!judge[i].getScore().equals("")){
			judgeScore += Integer.valueOf(judge[i].getScore());
		}
	}
	objectiveScore = singleScore + multiScore + judgeScore;
	paper.setObjectiveScore(objectiveScore+"");
}
else if (type.equals("subscore")){
	String questionID = request.getParameter("questionID");
	String score = request.getParameter("score");
	essayQuestionOnPaper essay[] = paper.getEssayQuestions();
	essay[Integer.valueOf(questionID)-1].setScore(score);
	paper.setEssayQuestions(essay);
}
else if (type.equals("subjective")){
	int subjectiveScore = 0;
	int finalScore = 0;
	essayQuestionOnPaper essay[] = paper.getEssayQuestions();
	for(int i = 0; i < essay.length; i++){
		if(!essay[i].getScore().equals("")){
			subjectiveScore += Integer.valueOf(essay[i].getScore());
		}
	}
	finalScore = subjectiveScore + Integer.valueOf(paper.getObjectiveScore());
	paper.setSubjectiveScore(subjectiveScore+"");
	paper.setFinalScore(finalScore+"");
}
else if (type.equals("cheat")){
	paper.setObjectiveScore("0");
	paper.setSubjectiveScore("0");
	paper.setFinalScore("0");
}
else{
	String questionID = request.getParameter("questionID");
	String answer = request.getParameter("answer");
	if (type.equals("single")){
		singleChoiceQuestionOnPaper single[] = paper.getSingleChoiceQuestions();
		singleChoiceBankXmlHelper singleHelper = new singleChoiceBankXmlHelper();
		singleHelper.path = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/";
		String rightAnswer = singleHelper.getQuestionsByProperty(new String[]{"1/single","2/single","3/single"}, "title", single[Integer.valueOf(questionID)-1].getTitle(), false).get(0).getRightChoice();	
		single[Integer.valueOf(questionID)-1].setStudentAnswer(answer);
		if (answer.equals(rightAnswer)){
			single[Integer.valueOf(questionID)-1].setScore(ruleHelper.getRuleByID("rule", exam.getRuleID()).getPerScoreOfSingleChoice());
		}
		else{
			single[Integer.valueOf(questionID)-1].setScore("0");
		}
		paper.setSingleChoiceQuestions(single);
	}
	else if (type.equals("multi")){
		String choice = request.getParameter("choice");
		multipleChoiceQuestionOnPaper multi[] = paper.getMultipleChoiceQuestions();
		multipleChoiceBankXmlHelper multiHelper = new multipleChoiceBankXmlHelper();
		multiHelper.path = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/";
		String studentChoices[] = multi[Integer.valueOf(questionID)-1].getStudentChoices();
		String rightChoices[] = multiHelper.getQuestionsByProperty(new String[]{"1/multi","2/multi","3/multi"}, "title",multi[Integer.valueOf(questionID)-1].getTitle(), false).get(0).getRightChoices();	
		for (int i = 0; i < 4; i++){
			if (studentChoices[i].equals("")){
				studentChoices[i] = "0";
			}
		}
		studentChoices[Integer.valueOf(choice)] = answer;
		multi[Integer.valueOf(questionID)-1].setStudentChoices(studentChoices);
		if (studentChoices[0].equals(rightChoices[0]) && studentChoices[1].equals(rightChoices[1]) && studentChoices[2].equals(rightChoices[2]) && studentChoices[3].equals(rightChoices[3])){
			multi[Integer.valueOf(questionID)-1].setScore(ruleHelper.getRuleByID("rule", exam.getRuleID()).getPerScoreOfMultiply());
		}
		else{
			multi[Integer.valueOf(questionID)-1].setScore("0");
		}
		paper.setMultipleChoiceQuestions(multi);
	}
	else if (type.equals("judge")){
		judgementQuestionOnPaper judge[] = paper.getJudgmentQuestions();
		judgementBankXmlHelper judgeHelper = new judgementBankXmlHelper();
		judgeHelper.path = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/";
		String rightAnswer = judgeHelper.getQuestionsByProperty(new String[]{"1/judge","2/judge","3/judge"}, "title", judge[Integer.valueOf(questionID)-1].getTitle(), false).get(0).getRightChoice();	
		judge[Integer.valueOf(questionID)-1].setStudentAnswer(answer);
		if (answer.equals(rightAnswer)){
			judge[Integer.valueOf(questionID)-1].setScore(ruleHelper.getRuleByID("rule", exam.getRuleID()).getPerScoreOfJudgment());
		}
		else{
			judge[Integer.valueOf(questionID)-1].setScore("0");
		}
		paper.setJudgmentQuestions(judge);
	}
	else if (type.equals("essay")){
		essayQuestionOnPaper essay[] = paper.getEssayQuestions();
		essay[Integer.valueOf(questionID)-1].setStudentAnswer(answer) ;
		paper.setEssayQuestions(essay);
	}
}
paperHelper.updatePaper(examID, paper.getPaperID(), paper.getStudentID(), paper.getTeacherID(), paper.getTestDate(), paper.getTotalScore(), paper.getExamTime(), paper.getUsedTime(), paper.getSingleChoiceQuestions(), paper.getJudgmentQuestions(), paper.getEssayQuestions(), paper.getMultipleChoiceQuestions(), paper.getSubjectiveScore(), paper.getObjectiveScore(), paper.getFinalScore());
%>