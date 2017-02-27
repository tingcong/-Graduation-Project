<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Logic.staticVariable" %>
<%@ page import="Logic.dirHelper" %>
<%@ page import="XML.essayQuestionBankXmlHelper" %>
<%
String courseID = request.getParameter("courseID");
String teacherID = request.getParameter("teacherID");
String level = request.getParameter("level");
String title = request.getParameter("title");
String right = request.getParameter("right");
essayQuestionBankXmlHelper essayHelper = new essayQuestionBankXmlHelper();
String dir = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/" + level;
dirHelper.makeDir(dir);
essayHelper.path = dir + "/";
essayHelper.addQuestion("essay", title, right);
%>