<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>�������߿���</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
function checkForm(form){
	if(form.stuName.value==""){
		alert("�����뿼������!");form.stuName.focus();return false;
	}
	if(form.pwd.value==""){
		alert("�������¼����!");form.pwd.focus();return false;
	}
	if(form.pwd.value.length<6 || form.pwd.value.length>20){
		alert("����������벻�Ϸ�������������6λ������С�ڵ�20λ!");form.pwd.focus();return false;
	}
	if(form.confimpwd.value==""){
		alert("��ȷ�ϵ�¼����!");form.confimpwd.focus();return false;
	}		
	if(form.pwd.value!=form.confimpwd.value){
		alert("����������ĵ�¼���벻һ�£�����������!");form.pwd.focus();return false;
	}
	if(form.secQue.value==""){
		alert("��������ʾ����!");form.secQue.focus();return false;
	}
	if(form.secAns.value==""){
		alert("�����������!");form.secAns.focus();return false;
	}
	if(form.IdCard.value==""){
		alert("���������֤�ţ�");form.IdCard.focus();return false;
	}
	if(form.IdCard.value.length!=18){
		alert("������Ϸ������֤�ţ�����Ϊ18λ����");form.IdCard.focus();return false;
	}
}
</script>
<body>
	<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td height="131" background="${pageContext.request.contextPath }/Images/top_bg.jpg">&nbsp;</td>
		</tr>
	</table>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td valign="top" bgcolor="#FFFFFF"><table width="774"
					height="487" border="0" cellpadding="0" cellspacing="0"
					align="center">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="word_grey">&nbsp;
										<img src="${pageContext.request.contextPath }/Images/f_ico.gif"
										width="8" height="8"> ��ǰλ�ã��� <span class="word_darkGrey">����ע��
											&gt;&gt;&gt;</span>
									</td>
									<td align="right">
										<img src="${pageContext.request.contextPath }/Images/m_ico1.gif" width="5" height="9">&nbsp;
										<a href="${pageContext.request.contextPath }/index.jsp">������ҳ</a>&nbsp;
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
							<s:form action="StudentAction_stuAdd" namespace="/student" method="post" onsubmit="return checkForm(this)">
								<table width="57%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr>
										<td height="30" align="left" style="padding:5px;">����������</td>
										<td align="left">
											<input name="stuName" type="text" size="20" />*
										</td>
									</tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">��&nbsp;&nbsp;&nbsp;&nbsp;�룺</td>
										<td align="left">
											<input name="pwd" size="20" type="password" />��������6��20λ�����ֻ���ĸ��ɣ� *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">ȷ�����룺</td>
										<td width="84%" align="left">
											<input id="confimpwd" size="20" type="password" />*
										</td>
									<tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
										<td align="left">
											<select name="stuSex">
												<option value="��">�� </option>
												<option value="Ů">Ů </option>
											</select>
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">��ʾ���⣺</td>
										<td width="84%" align="left">
											<input type="text" name="secQue" size="40" />�����ҵ����գ� *
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">����𰸣�</td>
										<td width="84%" align="left">
											<input type="text" name="secAns"size="40" />����7��17�գ�*
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">ר&nbsp;&nbsp;&nbsp;&nbsp;ҵ��</td>
										<td width="84%" align="left">
											<input type="text" name="procession" size="40" />
										</td>
									</tr>
									<tr align="center">
										<td width="16%" height="30" align="left" style="padding:5px;">���֤�ţ�</td>
										<td width="84%" align="left">
											<input name="IdCard" size="40" type="text"/>*
										</td>
									</tr>
									<tr align="center">
										<td width="100%" colspan="2">
											<s:actionerror/>
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey" value="����" />&nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
											<input type="button" class="btn_grey" value="����" onclick="history.back()"/></td>
									</tr>
								</table>
							</s:form>
						</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<%@ include file="copyright.jsp"%>
</body>
</html>
