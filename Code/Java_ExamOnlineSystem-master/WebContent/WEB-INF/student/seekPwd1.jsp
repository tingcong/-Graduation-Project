<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>�������߿���</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.answer.value==""){
		alert("������������ʾ�����!");form.answer.focus();return false;
	}
}
</script>
<body>
	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="131" background="${pageContext.request.contextPath }/Images/top_bg.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0"
		cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="474" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="word_grey">&nbsp;
									<img src="${pageContext.request.contextPath }/Images/f_ico.gif"
										width="8" height="8"> ��ǰλ�ã��� <span class="word_darkGrey">�һ�����
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5"
										height="9">&nbsp;
										<a href="${pageContext.request.contextPath }/index.jsp">������ҳ</a>&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="257" align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table> 
							<s:form  action="StudentAction_step3" namespace="/student" method="post" onsubmit="return checkForm(this)">
								<table width="57%" height="69" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td width="17%">
											<img src="${pageContext.request.contextPath }/Images/step2.gif" width="73" height="30">
										</td>
										<td width="83%" class="word_orange1"><span
											style="padding:5px;">����������ʾ�����</span>
										</td>
									</tr>
								</table>
								<table width="57%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr align="center">
										<font color="red"><s:actionerror/></font>
										<td width="22%" height="30" align="left" style="padding:5px;">������ʾ���⣺</td>
										<td width="78%" align="left">
											<span class="word_orange1"> ��ֻ����</span>
											<s:textfield name="secQue" size="40" readonly="true"/>
										</td>
									</tr>
									<tr align="center">
										<td width="22%" height="30" align="left" style="padding:5px;">������ʾ�𰸣�</td>
										<td width="78%" align="left">
											<input type="text" name="answer" size="40" /> 
											<span class="word_orange1"> *</span>
										</td>
									</tr>
									<tr align="center">
										<td align="center" colspan="3">
											<s:actionerror/>
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="��һ��" />&nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
										</td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
					<tr>
						<td height="141" align="right" valign="top"><img
							src="${pageContext.request.contextPath }/Images/seedPwd.gif" width="139" height="153">
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
