<%@page import="com.examonline.util.PageBean"%>
<%@page import="com.examonline.util.PageInfo"%>
<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
	<title>�������߿���</title>
	<link href="${pageContext.request.contextPath }/CSS/style.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/common.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajaxRequest.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/page.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/ajax.js" charset="gb2312"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/JS/function.js" charset="gb2312"></script>
</head>
<body>
	<%@ include file="top.jsp"%>
	<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
		<tr>
			<td width="176" align="center" valign="top" bgcolor="#FFFFFF">
				<%@ include file="left.jsp"%></td>
			<td width="602" valign="top" bgcolor="#FFFFFF">
				<table width="99%" height="487" border="0" cellpadding="0" cellspacing="0" align="right">
					<tr>
						<td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table
								width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="78%" class="word_grey">&nbsp;��ǰλ�ã�<span
										class="word_darkGrey">������Ϣ���� &gt;&gt;&gt;</span>
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
							<table width="96%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="90%" height="27" align="right"><img
										src="${pageContext.request.contextPath }/Images/add.gif" width="19" height="18">&nbsp;</td>
									<td width="10%">
										<s:a namespace="/manger" action="TaotiAction_add">�������</s:a>
									</td>
								</tr>
							</table>
							<s:form action="TaotiAction_doDel" namespace="/manger" method="post" id="taoTiForm">
							<s:hidden name="id"></s:hidden>
								<table width="96%" border="1" cellpadding="0" cellspacing="0"
									bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
									bordercolorlight="#67A8DB">
										<tr align="center">
											<td width="29%" height="30" bgcolor="#B2D6F1">��������</td>
											<td width="25%" bgcolor="#B2D6F1">�����γ�</td>
											<td width="32%" bgcolor="#B2D6F1">����ʱ��</td>
											<td width="7%" bgcolor="#B2D6F1">�޸�</td>
											<td width="7%" bgcolor="#B2D6F1">ѡ��</td>
										</tr>
										<s:iterator value="taotis">
										<tr>
											<td align="center"><s:property value="name"/></td>
											
											<td align="center"><s:property value="lesson.lessonName"/></td>
											
											<td align="center"><s:date name="joinTime" format="yyyy-MM-dd HH:mm:ss"/></td>
										
											<td align="center"><a href="${pageContext.request.contextPath }/manger/TaotiAction_edit.do?id=<s:property value="id"/>">�޸�</a>
											
											<td align="center"><input type="checkbox" id="delId" value="<s:property value="id"/>"></td>
										</s:iterator>
								</table>
								<table width="94%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="60%" height="24">&nbsp;</td>
										<td width="40%" align="right">
											<input name="checkbox"
											type="checkbox" class="noborder"
											onClick="CheckAll(taoTiForm.delId,taoTiForm.checkbox)">
											[ȫѡ/��ѡ] 
											[<a style="color:red;cursor:hand;"
												onClick="checkdel(taoTiForm.delId,taoTiForm)">ɾ��</a>]
											<div id="ch" style="display: none;">
												<input id="delId" type="checkbox" class="noborder"
													value="0">
											</div>
										</td>
									</tr>
								</table>
								<table>
									<%	
										 PageBean pageBean=(PageBean)request.getAttribute("pageBean");
									%>
									<tr>
										 <td width="17%" align="left">�ܼ�¼����<%=pageBean.getTotalResult() %>��</td> 
										 <td width="2%" align="right"></td>      
							             <%if(pageBean.getFirstPage()){ %>           
								             <td width="8%" align="center">��ҳ&nbsp;&nbsp;|</td>
								             <td width="12%" align="center">��һҳ&nbsp;&nbsp;&nbsp;|</td>
							             <%}else{ %>
								             <td width="8%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','start','taoTiForm')">��ҳ&nbsp;&nbsp;|</a></td>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','prev','taoTiForm')">��һҳ&nbsp;&nbsp;&nbsp;|</a></td>
							             <%} %>
							             <%if(pageBean.getLastPage()){ %>
											 <td width="12%" align="center">��һҳ&nbsp;&nbsp;&nbsp;|</td>
								             <td width="8%" align="center">ĩҳ</td>
							             <%}else{ %>
								             <td width="12%" align="center"><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','next','taoTiForm')">��һҳ&nbsp;&nbsp;&nbsp;|</a></td>
								             <td width="8%" align="center"><u><a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','end','taoTiForm')">ĩҳ</a></td>
							             <%} %>
							             <td width="8%" align="center">��<%=pageBean.getPageNo()%>ҳ</td>
							             <td width="8%" align="center">��<%=pageBean.getSumPage() %>ҳ</td>
							             <td width="20%" align="right">����<input size="1" type="text" name="goPage" >ҳ
							             <a href="#" onClick="gotopage('${pageContext.request.contextPath }/manger/TaotiAction_index.do','go','taoTiForm')">ȷ��</a></td>
							             
							             <td><input type="hidden" name="pageNO" value="<%=pageBean.getPageNo() %>" ></td> 
							             <td><input type="hidden" name="prevpageNO" value="<%=pageBean.getPageNo()-1 %>"></td>
							             <td><input type="hidden" name="nextpageNO" value="<%=pageBean.getPageNo()+1 %>"></td>
							             <td><input type="hidden" name="sumPage" value="<%=pageBean.getSumPage() %>" ></td>
							             <td><input type="hidden" name="pageSize" value=" " ></td> 
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
