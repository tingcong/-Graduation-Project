<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<title>�������߿���</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function checkForm(form){
		if(form.name.value==""){
			alert("��������������!");
			form.name.focus();
			return false;
		}
	}
</script>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%></td>
			<td width="602" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">������Ϣ���� &gt; �޸�������Ϣ &gt;&gt;&gt;</span>
									</td>
									<td align="right">
									<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">
										&nbsp;��ǰ����Ա��${user.realName } &nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center" valign="top">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="84%">&nbsp;</td>
								</tr>
							</table> 
							<s:form action="TaotiAction_doEdit.do" namespace="/manger" method="post" onsubmit="return checkForm(this)">
								<s:hidden name="id"/>
								<table width="63%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr align="center">
										<td width="27%" height="30" align="left" style="padding:5px;">�������ƣ�</td>
										<td width="73%" align="left">
											<s:textfield name="name" size="25"/>
										</td>
									<tr>
										<td height="30" align="left" style="padding:5px;">�����γ̣�</td>
										<td align="left">
										<s:select list="lessons" name="lessonId" listKey="id" listValue="name" headerKey="" headerValue="��ѡ��γ�"></s:select>
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="����" /> &nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp; 
											<input type="button" class="btn_grey" value="����"/>&nbsp;
										</td>
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
