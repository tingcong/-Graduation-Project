<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<head>
	<title>�������߿��ԡ�����̨��¼</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript">
		function check(form){
			if (form.userName.value==""){
				alert("���������Ա����!");
				form.userName.focus();
				return false;
			}
			if (form.password.value==""){
				alert("����������!");
				form.password.focus();
				return false;
			}	
		}
	</script>
</head>
<body>
	<table width="100%" height="100%" border="0" cellpadding="0"
		cellspacing="0">
		<tr>
			<td bgcolor="#EEEEEE">
				<table width="464" height="294" border="0"
					align="center" cellpadding="0" cellspacing="0"
					background="${pageContext.request.contextPath }/Images/m_login.jpg">
					<tr>
						<td width="157" height="153">&nbsp; <br></td>
						<td width="307">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td valign="top">

							<form action="./manger/LoginAction_login.do" method="post" focus="name" onsubmit="return check(this)">

							<form action="${pageContext.request.contextPath }/manger/question_index.do" method="post" focus="name" onsubmit="return check(this)">

								<table width="100%" border="0" cellpadding="0" cellspacing="0"
									bordercolorlight="#FFFFFF" bordercolordark="#D2E3E6">
									<tr>
										<td width="26%" height="30">����Ա���ƣ�</td>
										<td width="74%">
											<input name="userName" type="text" size="25" />
										</td>
									</tr>
									<tr>
										<td height="30">����Ա���룺</td>
										<td>
											<input name="password" type="password" size="25" />
										</td>
									</tr>
									<tr>
										<td colspan="2">
										<font color="red"><s:actionerror/></font>	
										</td>
									</tr>
									<tr>
										<td height="33" colspan="2" align="center">
											<input class="btn_grey" type="submit" value="ȷ��" /> &nbsp;
											<input value="����" class="btn_grey" type="reset"/>&nbsp; 
											<input type="button" class="btn_grey" value="�ر�" onclick="window.close()" />
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
