<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="XML.paperCreationRulesXmlHelper" %>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%@ page import="XML.singleChoiceBankXmlHelper" %>
<%@ page import="XML.multipleChoiceBankXmlHelper" %>
<%@ page import="XML.judgementBankXmlHelper" %>
<%@ page import="XML.essayQuestionBankXmlHelper" %>
<%@ page import="XML.singleChoiceQuestionOnBank" %>
<%@ page import="XML.multipleChoiceQuestionOnBank" %>
<%@ page import="XML.judgementQuestionOnBank" %>
<%@ page import="XML.essayQuestionOnBank" %>
<%@ page import="XML.singleChoiceQuestionOnPaper" %>
<%@ page import="XML.multipleChoiceQuestionOnPaper" %>
<%@ page import="XML.judgementQuestionOnPaper" %>
<%@ page import="XML.essayQuestionOnPaper" %>
<%@ page import="XML.papersSaveXmlHelper" %>
<%@ page import="Logic.staticVariable" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%
String examid = request.getParameter("examid");
String totalScore = request.getParameter("totalScore");
String examTime = request.getParameter("examTime");
String difficulty = request.getParameter("difficulty");
String numberOfSingleChoice = request.getParameter("numberOfSingleChoice");
String perScoreOfSingleChoice = request.getParameter("perScoreOfSingleChoice");
String numberOfMultiChoice = request.getParameter("numberOfMultiChoice");
String perScoreOfMultiChoice = request.getParameter("perScoreOfMultiChoice");
String numberOfJudgment = request.getParameter("numberOfJudgment");
String perScoreOfJudgment = request.getParameter("perScoreOfJudgment");
String numberOfEssay = request.getParameter("numberOfEssay");
String perScoreOfEssay = request.getParameter("perScoreOfEssay");
paperCreationRulesXmlHelper ruleHelper = new paperCreationRulesXmlHelper();
examArrangementXmlHelper examHelper = new examArrangementXmlHelper();
papersSaveXmlHelper paperHelper = new papersSaveXmlHelper();
examinationBean exam = examHelper.getExaminationByID("exam", examid);
String ruleID = ruleHelper.addRule("rule", totalScore, examTime, difficulty, numberOfSingleChoice, perScoreOfSingleChoice, numberOfJudgment, perScoreOfJudgment, numberOfEssay, perScoreOfEssay, numberOfMultiChoice, perScoreOfMultiChoice);
examHelper.updateExamination("exam", examid, ruleID, exam.getExaminationName(), exam.getCourseID(), exam.getTeacherID(), exam.getDateBegin(), exam.getDateEnd(), exam.getIsScored());
int singleNumber = Integer.valueOf(numberOfSingleChoice);
int multiNumber = Integer.valueOf(numberOfMultiChoice);
int judgeNumber = Integer.valueOf(numberOfJudgment);
int essayNumber = Integer.valueOf(numberOfEssay);
singleChoiceQuestionOnBank singleBank[] = new singleChoiceQuestionOnBank[singleNumber];
multipleChoiceQuestionOnBank multiBank[] = new multipleChoiceQuestionOnBank[multiNumber];
judgementQuestionOnBank judgeBank[] = new judgementQuestionOnBank[judgeNumber];
essayQuestionOnBank essayBank[] = new essayQuestionOnBank[essayNumber];
singleChoiceQuestionOnPaper singlePaper[] = new singleChoiceQuestionOnPaper[singleNumber];
multipleChoiceQuestionOnPaper multiPaper[] = new multipleChoiceQuestionOnPaper[multiNumber];
judgementQuestionOnPaper judgePaper[] = new judgementQuestionOnPaper[judgeNumber];
essayQuestionOnPaper essayPaper[] = new essayQuestionOnPaper[essayNumber];
paperHelper.path = staticVariable.path + "papers/";
ArrayList<String> studentID = new ArrayList<String>();
String sql="SELECT studentID FROM sc WHERE courseID='" + exam.getCourseID() + "'";
DBHelper.getConnection();
ResultSet rs = DBHelper.Query(sql);
while(rs.next()){
	studentID.add(rs.getString("studentID"));
}
singleChoiceBankXmlHelper singleHelper = new singleChoiceBankXmlHelper();
multipleChoiceBankXmlHelper multiHelper = new multipleChoiceBankXmlHelper();
judgementBankXmlHelper judgeHelper = new judgementBankXmlHelper();
essayQuestionBankXmlHelper essayHelper = new essayQuestionBankXmlHelper();
ArrayList<String> single1 = new ArrayList<String>();
ArrayList<String> single2 = new ArrayList<String>();
ArrayList<String> single3 = new ArrayList<String>();
ArrayList<String> multi1 = new ArrayList<String>();
ArrayList<String> multi2 = new ArrayList<String>();
ArrayList<String> multi3 = new ArrayList<String>();
ArrayList<String> judge1 = new ArrayList<String>();
ArrayList<String> judge2 = new ArrayList<String>();
ArrayList<String> judge3 = new ArrayList<String>();
ArrayList<String> essay1 = new ArrayList<String>();
ArrayList<String> essay2 = new ArrayList<String>();
ArrayList<String> essay3 = new ArrayList<String>();
for(int i = 0; i < studentID.size(); i++){
	double m1,m2;
	if (difficulty.equals("1")){
		m1 = 0.5;
		m2 = 0.8;
	}
	else if (difficulty.equals("2")){
		m1 = 0.3;
		m2 = 0.8;
	}
	else if (difficulty.equals("3")){
		m1 = 0.2;
		m2 = 0.5;
	}
	else {
		m1 = 0.2;
		m2 = 0.5;
	}
	double random;
	for(int j = 0; j < singleNumber; j++){
		random = Math.random();
		if(random < m1){
			singleHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/1/";
			int count = singleHelper.count("single");
			int num=(int)(Math.random()*(count-1))+1;
			while (single1.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			single1.add(num+"");
			singleBank[j] = singleHelper.getQuestionByID("single", num+"");
			singlePaper[j] = new singleChoiceQuestionOnPaper();
			singlePaper[j].setTitle(singleBank[j].getTitle());
			singlePaper[j].setChoices(singleBank[j].getChoices());
			singlePaper[j].setStudentAnswer("");
			singlePaper[j].setScore("");
		}
		else if(random < m2){
			singleHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/2/";
			int count = singleHelper.count("single");
			int num=(int)(Math.random()*(count-1))+1;
			while (single2.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			single2.add(num+"");
			singleBank[j] = singleHelper.getQuestionByID("single", num+"");
			singlePaper[j] = new singleChoiceQuestionOnPaper();
			singlePaper[j].setTitle(singleBank[j].getTitle());
			singlePaper[j].setChoices(singleBank[j].getChoices());
			singlePaper[j].setStudentAnswer("");
			singlePaper[j].setScore("");
		}
		else{
			singleHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/3/";
			int count = singleHelper.count("single");
			int num=(int)(Math.random()*(count-1))+1;
			while (single3.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			single3.add(num+"");
			singleBank[j] = singleHelper.getQuestionByID("single", num+"");
			singlePaper[j] = new singleChoiceQuestionOnPaper();
			singlePaper[j].setTitle(singleBank[j].getTitle());
			singlePaper[j].setChoices(singleBank[j].getChoices());
			singlePaper[j].setStudentAnswer("");
			singlePaper[j].setScore("");
		}
	}
	for(int j = 0; j < multiNumber; j++){
		random = Math.random();
		if(random < m1){
			multiHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/1/";
			int count = multiHelper.count("multi");
			int num=(int)(Math.random()*(count-1))+1;
			while (multi1.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			multi1.add(num+"");
			multiBank[j] = multiHelper.getQuestionByID("multi", num+"");
			multiPaper[j] = new multipleChoiceQuestionOnPaper();
			multiPaper[j].setTitle(multiBank[j].getTitle());
			multiPaper[j].setChoices(multiBank[j].getChoices());
			multiPaper[j].setStudentChoices(new String[]{});
			multiPaper[j].setScore("");
		}
		else if(random < m2){
			multiHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/2/";
			int count = multiHelper.count("multi");
			int num=(int)(Math.random()*(count-1))+1;
			while (multi2.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			multi2.add(num+"");
			multiBank[j] = multiHelper.getQuestionByID("multi", num+"");
			multiPaper[j] = new multipleChoiceQuestionOnPaper();
			multiPaper[j].setTitle(multiBank[j].getTitle());
			multiPaper[j].setChoices(multiBank[j].getChoices());
			multiPaper[j].setStudentChoices(new String[]{});
			multiPaper[j].setScore("");
		}
		else{
			multiHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/3/";
			int count = multiHelper.count("multi");
			int num=(int)(Math.random()*(count-1))+1;
			while (multi3.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			multi3.add(num+"");
			multiBank[j] = multiHelper.getQuestionByID("multi", num+"");
			multiPaper[j] = new multipleChoiceQuestionOnPaper();
			multiPaper[j].setTitle(multiBank[j].getTitle());
			multiPaper[j].setChoices(multiBank[j].getChoices());
			multiPaper[j].setStudentChoices(new String[]{});
			multiPaper[j].setScore("");
		}
	}
	for(int j = 0; j < judgeNumber; j++){
		random = Math.random();
		if(random < m1){
			judgeHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/1/";
			int count = judgeHelper.count("judge");
			int num=(int)(Math.random()*(count-1))+1;
			while (judge1.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			judge1.add(num+"");
			judgeBank[j] = judgeHelper.getQuestionByID("judge", num+"");
			judgePaper[j] = new judgementQuestionOnPaper();
			judgePaper[j].setTitle(judgeBank[j].getTitle());
			judgePaper[j].setStudentAnswer("");
			judgePaper[j].setScore("");
		}
		else if(random < m2){
			judgeHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/2/";
			int count = judgeHelper.count("judge");
			int num=(int)(Math.random()*(count-1))+1;
			while (judge2.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			judge2.add(num+"");
			judgeBank[j] = judgeHelper.getQuestionByID("judge", num+"");
			judgePaper[j] = new judgementQuestionOnPaper();
			judgePaper[j].setTitle(judgeBank[j].getTitle());
			judgePaper[j].setStudentAnswer("");
			judgePaper[j].setScore("");
		}
		else{
			judgeHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/3/";
			int count = judgeHelper.count("judge");
			int num=(int)(Math.random()*(count-1))+1;
			while (judge3.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			judge3.add(num+"");
			judgeBank[j] = judgeHelper.getQuestionByID("judge", num+"");
			judgePaper[j] = new judgementQuestionOnPaper();
			judgePaper[j].setTitle(judgeBank[j].getTitle());
			judgePaper[j].setStudentAnswer("");
			judgePaper[j].setScore("");
		}
	}
	for(int j = 0; j < essayNumber; j++){
		random = Math.random();
		if(random < m1){
			essayHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/1/";
			int count = essayHelper.count("essay");
			int num=(int)(Math.random()*(count-1))+1;
			while (essay1.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			essay1.add(num+"");
			essayBank[j] = essayHelper.getQuestionByID("essay", num+"");
			essayPaper[j] = new essayQuestionOnPaper();
			essayPaper[j].setTitle(essayBank[j].getTitle());
			essayPaper[j].setStudentAnswer("");
			essayPaper[j].setScore("");
		}
		else if(random < m2){
			essayHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/2/";
			int count = essayHelper.count("essay");
			int num=(int)(Math.random()*(count-1))+1;
			while (essay2.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			essay2.add(num+"");
			essayBank[j] = essayHelper.getQuestionByID("essay", num+"");
			essayPaper[j] = new essayQuestionOnPaper();
			essayPaper[j].setTitle(essayBank[j].getTitle());
			essayPaper[j].setStudentAnswer("");
			essayPaper[j].setScore("");
		}
		else{
			essayHelper.path = staticVariable.path + "/" + "questions/" + exam.getCourseID() + "/" + exam.getTeacherID() + "/3/";
			int count = essayHelper.count("essay");
			int num=(int)(Math.random()*(count-1))+1;
			while (essay3.contains(num+"")){
				num=(int)(Math.random()*(count-1))+1;
			}
			essay3.add(num+"");
			essayBank[j] = essayHelper.getQuestionByID("essay", num+"");
			essayPaper[j] = new essayQuestionOnPaper();
			essayPaper[j].setTitle(essayBank[j].getTitle());
			essayPaper[j].setStudentAnswer("");
			essayPaper[j].setScore("");
		}
	}
	paperHelper.addPaper(examid, studentID.get(i), exam.getTeacherID(), exam.getDateBegin(), totalScore, examTime, examTime, singlePaper, judgePaper, essayPaper, multiPaper, "", "", "");
}
%>	