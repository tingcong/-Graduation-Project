<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Logic.staticVariable" %>
<%@ page import="Logic.dirHelper" %>
<%@ page import="XML.multipleChoiceBankXmlHelper" %>
<%
String courseID = request.getParameter("courseID");
String teacherID = request.getParameter("teacherID");
String level = request.getParameter("level");
String title = request.getParameter("title");
String choiceA = request.getParameter("choiceA");
String choiceB = request.getParameter("choiceB");
String choiceC = request.getParameter("choiceC");
String choiceD = request.getParameter("choiceD");
String rightA = request.getParameter("rightA");
String rightB = request.getParameter("rightB");
String rightC = request.getParameter("rightC");
String rightD = request.getParameter("rightD");
System.out.println(level);
System.out.println(title);
System.out.println(choiceA);
System.out.println(choiceB);
System.out.println(choiceC);
System.out.println(choiceD);
System.out.println(rightA);
System.out.println(rightB);
System.out.println(rightC);
System.out.println(rightD);
multipleChoiceBankXmlHelper multiHelper = new multipleChoiceBankXmlHelper();
String dir = staticVariable.path + "questions/" + courseID + "/" + teacherID + "/" + level;
dirHelper.makeDir(dir);
multiHelper.path = dir + "/";
multiHelper.addQuestion("multi", title, new String[]{choiceA,choiceB,choiceC,choiceD}, new String[]{rightA,rightB,rightC,rightD});
%>	