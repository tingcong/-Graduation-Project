<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Logic.timeHelper" %>
<%@ page import="XML.examArrangementXmlHelper" %>
<%
String examName = request.getParameter("examName");
String courseID = request.getParameter("courseID");
String teacherID = request.getParameter("teacherID");
String dateBeginString = request.getParameter("dateBeginString");
String dateEndString = request.getParameter("dateEndString");
String dateBegin = timeHelper.date2TimeStamp(dateBeginString, "yyyy-MM-dd HH:mm:ss");
String dateEnd = timeHelper.date2TimeStamp(dateEndString, "yyyy-MM-dd HH:mm:ss");
System.out.println(examName);
System.out.println(courseID);
System.out.println(teacherID);
System.out.println(dateBeginString);
System.out.println(dateEndString);
System.out.println(dateBegin);
System.out.println(dateEnd);
examArrangementXmlHelper exam = new examArrangementXmlHelper();
exam.addExamination("exam", "-1", examName, courseID, teacherID, dateBegin, dateEnd, "-1");
%>