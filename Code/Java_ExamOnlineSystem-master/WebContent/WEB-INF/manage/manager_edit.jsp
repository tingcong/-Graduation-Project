<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>��ӹ���Ա��Ϣ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js"></script>
</head>
<script type="text/javascript">
	function check(form) {
		if (form.userName.value == "") {
			alert("���������Ա����!");
			form.userName.focus();
			return;
		}
		if (form.password.value == "") {
			alert("���������Ա����!");
			form.password.focus();
			return;
		}
		if (form.confimpassword.value == "") {
			alert("��ȷ�Ϲ���Ա����!");
			form.confimpassword.focus();
			return;
		}
		if (form.confimpassword.value != form.password.value) {
			alert("����������Ĺ���Ա���벻һ�£�����������!");
			form.confimpassword.focus();
			return;
		}
		//�жϵ�ǰ�༭�û������Ƿ��޸�������
	   
		form.submit();
		alert("���ȷ��ˢ���б�ҳ�棡"); 	
		//�رմ���	 
		refreshOpener();
	}
</script>
<body>
	<table width="292" height="190" border="0" cellpadding="0"
		cellspacing="0" background="${pageContext.request.contextPath }/Images/subBG.jpg">
		<tr>
			<td valign="top">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="12%" height="47">&nbsp;</td>
						<td width="85%" valign="bottom">
							<table width="86%" height="31" border="0" align="center" cellpadding="0" cellspacing="0">
								<tr>
									<td class="word_white">�޸Ĺ���Ա��Ϣ</td>
								</tr>
							</table>
						</td>
						<td width="3%">&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>
							<table width="100%" height="116" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td height="116" align="center" valign="top">
										<s:form action="UserAction_doedit" namespace="/manger" method="post" id="managerForm" >
											<s:hidden name="id"></s:hidden>
											<table height="116" border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td width="81" height="30" align="center">��¼&nbsp;�˻���</td>
													<td width="167">
														<s:textfield name="userName" readonly="true"/>
													</td>
												</tr>
												<tr>
													<td width="81" height="30" align="center">����Ա���ƣ�</td>
													<td width="167">
														<s:textfield name="realName" />
													</td>
												</tr>
												<tr>
													<td height="28" align="center">����Ա���룺</td>
													<td>
														<s:password name="password" showPassword="true"/>
													</td>
												</tr>
												<tr>
													<td height="28" align="center">ȷ�� &nbsp;���룺</td>
													<td>
														<s:password name="confimpassword" showPassword="true"/>
													</td>
												</tr>
												<tr>
													<td height="30" align="center">&nbsp;</td>
													<td>
														<input type="button" class="btn_grey" value="����"
															onclick="check(managerForm)" /> &nbsp; 
														<input type="button" class="btn_grey" value="�ر�"
															onclick="window.close();" />
													</td>
												</tr>
											</table>
										</s:form>
									</td>
								</tr>
							</table>
						</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
