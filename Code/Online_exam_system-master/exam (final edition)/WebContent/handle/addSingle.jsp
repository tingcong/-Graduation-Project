<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Logic.staticVariable" %>
<%@ page import="Logic.dirHelper" %>
<%@ page import="XML.singleChoiceBankXmlHelper" %>
<%
String courseID = request.getParameter("courseID");
String teacherID = request.getParameter("teacherID");
String level = request.getParameter("level");
String title = request.getParameter("title");
String choiceA = request.getParameter("choiceA");
String choiceB = request.getParameter("choiceB");
String choiceC = request.getParameter("choiceC");
String choiceD = request.getParameter("choiceD");
String rightChoice = request.getParameter("rightChoice");
singleChoiceBankXmlHelper singleHelper = new singleChoiceBankXmlHelper();
String dir = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/" + level;
dirHelper.makeDir(dir);
singleHelper.path = dir + "/";
singleHelper.addQuestion("single", title, new String[]{choiceA,choiceB,choiceC,choiceD}, rightChoice);
%>	