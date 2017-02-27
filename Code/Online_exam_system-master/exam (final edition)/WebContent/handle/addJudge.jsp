<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Logic.staticVariable" %>
<%@ page import="Logic.dirHelper" %>
<%@ page import="XML.judgementBankXmlHelper" %>
<%
String courseID = request.getParameter("courseID");
String teacherID = request.getParameter("teacherID");
String level = request.getParameter("level");
String title = request.getParameter("title");
String rightChoice = request.getParameter("rightChoice");
judgementBankXmlHelper judgeHelper = new judgementBankXmlHelper();
String dir = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/" + level;
dirHelper.makeDir(dir);
judgeHelper.path = dir + "/";
judgeHelper.addQuestion("judge", title, rightChoice);
%>