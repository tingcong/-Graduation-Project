<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	String path = request.getContextPath();
	if (session.getAttribute("student") == null) {
		response.sendRedirect(path + "/index.jsp");
	}
%>
<html>
<head>
	<title>�������߿���</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<body>

	<table width="778" border="0" align="center" cellpadding="0"
		cellspacing="0">
		<tr>
			<td height="131"
				background="${pageContext.request.contextPath }/Images/top_bg.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="76%" class="word_grey">&nbsp;
										<img src="${pageContext.request.contextPath }/Images/f_ico.gif" width="8" height="8"> ��ǰλ�ã��� <span
										class="word_darkGrey">���߿��� �� ���Թ��� &gt;&gt;&gt;</span>
									</td>
									<td width="24%" align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9"> 
										<input type="button" class="btn_grey" value="������ҳ" onclick="history.back(-1)" />&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<s:form namespace="/student" action="ExamAction_selectLesson"  method="post">
								<table width="100%" height="253" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="81" colspan="3" align="center"
											class="word_orange1">���Թ���</td>
									</tr>
									<tr>
										<td width="12%">&nbsp;</td>
										<td width="77%" valign="top">&nbsp;&nbsp;&nbsp;&nbsp;�������߿���ϵͳ���������ҳ����ˢ�¡����˵Ȳ������������Ը�������ڹ涨�Ŀ���ʱ����û�н���ϵͳ���Զ��ύ�Ծ�ÿλ����ͬһ���γ�ֻ�ܿ�һ�Σ�ϵͳ�ἰʱ֪ͨ���Եľ���ʱ�䣻�뿼����ע���Կγ��Լ�����ʱ�䣡<br>
											&nbsp;&nbsp;&nbsp;&nbsp;ֻ��ͬ�����Ϲ���ſ��Խ��п��ԡ���������������δ�ҵ���صĿ��Կγ̣��������Ա��ϵ��
										</td>
										<td width="11%">&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center" valign="top">
											<input type="submit" class="btn_grey" value="ͬ��" />
										</td>
										<td>&nbsp;</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
