<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="XML.examArrangementXmlHelper" %>
<%@ page import="XML.examinationBean" %>
<%
String examID = request.getParameter("examID");
examArrangementXmlHelper examHelper = new examArrangementXmlHelper();
examinationBean exam = examHelper.getExaminationByID("exam", examID);
exam.setIsScored("1");
System.out.print(examID);
examHelper.updateExamination("exam", exam.getExaminationID(), exam.getRuleID(), exam.getExaminationName(), exam.getCourseID(), exam.getTeacherID(), exam.getDateBegin(), exam.getDateEnd(), exam.getIsScored());
%>