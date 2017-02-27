<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<title>�������߿��ԡ�����̨����</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
</head>
<script type="text/javascript">
	function checkForm(form) {
		if (form.questionName.value == "") {
			alert("�����뿼����Ŀ����!");
			form.questionName.focus();
			return false;
		}
	}
	function show(val) {
		if (val == "��ѡ��") {
			sOption.style.display = "";
			mOption.style.display = "none";
		} else if (val == "��ѡ��") {
			sOption.style.display = "none";
			document.getElementById("sso").disabled=true;//���ò��ύ����
			mOption.style.display = "";
		}
	}
</script>
<body >
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%>
			</td>
			<td width="602" valign="top" bgcolor="#FFFFFF"><table
					width="99%" height="487" border="0" cellpadding="0" cellspacing="0"
					align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">������Ŀ���� &gt; �޸Ŀ�����Ŀ &gt;&gt;&gt;</span>
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
							<s:form namespace="/manger" action="question_doedit" method="post" onsubmit="return checkForm(this)">
								<table width="85%" border="0" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#D2E3E6"
									bordercolorlight="#FFFFFF">
									<tr>
										<td height="30" align="left" style="padding:5px;">�������⣺</td>
										<td align="left">
											<s:select list="taotis" name="taotiId" listKey="id" listValue="name" value="taoti.id"></s:select>
										</td>
									</tr>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding:5px;">������Ŀ��</td>
										<td width="85%" align="left">
											<s:textfield name="questionName"  size="40"/>*
										</td>
									<tr>
									<tr>
										<td height="30" align="left" style="padding:5px;">�������ͣ�</td>
										<td align="left">
											<select name="type" onchange="show(this.value)">
												<option ${type eq '��ѡ��'?'selected':'' } value="��ѡ��">��ѡ��</option>
												<option  ${type eq '��ѡ��'?'selected':'' } value="��ѡ��">��ѡ��</option>
											</select>
										</td>
									</tr>
									<s:set name="option" value="{'A','B','C','D'}"/>
									<s:iterator value="optionArray" status="sto">
										<tr align="center">
											<td width="15%" height="30" align="left" style="padding:5px;">ѡ��<s:property value="%{#option[#sto.index]}"/>��</td>
											<td width="85%" align="left">
												<input type="text" name="options" size="40" value="<s:property/>">*
											</td>
										</tr>
									</s:iterator>
									<tr align="center">
										<td width="15%" height="30" align="left" style="padding:5px;">��ȷ�𰸣�</td>
										<td width="85%" align="left" id="sOption">
											<select name="rightAnswer" class="noborder" id="sso">
												<option value="0">A </option>
												<option value="1">B </option>
												<option value="2">C</option>
												<option value="3">D</option>
											</select>
										</td>
										<td width="85%" align="left" id="mOption" style="display: none; font-size: 10pt;line-height: 30px;">
											<span><input name="rightAnswer" type="checkbox" value="0">:A</span>
											<span><input name="rightAnswer" type="checkbox" value="1">:B</span>
											<span><input name="rightAnswer" type="checkbox" value="2">:C</span>
											<span><input name="rightAnswer" type="checkbox" value="3">:D</span>
										</td>
									</tr>

									<tr align="center">
										<td width="15%" height="30" align="left" style="padding:5px;">��ע��</td>
										<td width="85%" align="left">
											<s:textfield name="note" size="40" />
										</td>
									</tr>
									<tr>
										<td height="65" align="left" style="padding:5px;">&nbsp;</td>
										<td>
											<input type="submit" class="btn_grey"value="����" /> &nbsp; 
											<input type="reset" class="btn_grey" value="ȡ��" /> &nbsp;
											<input type="button" class="btn_grey" value="����" />
										</td>
									</tr>
									<tr>
										<td>
											<input type="hidden" readonly="readonly" name="id" value="${model.id}">
										</td>
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
