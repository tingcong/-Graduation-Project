<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DB.DBHelper" %>
<%
	String quit = null;
	String userInfo = null;
	String userInfoList[] = null;
	String userID = null;
	String password = null;
	String userType = null;
	String idType = null;
	String sql = null;
	String uid = null;
	String name = null;
	String pwd = null;
	boolean user = false;
	boolean loggedin = false;
	boolean usernameError = false;
	boolean passwordError = false;
	request.setCharacterEncoding("utf-8");
 	Cookie cookie = null;
	Cookie[] cookies = request.getCookies(); 
 	for(int i = 0; cookies != null && i < cookies.length; i++){
		cookie = cookies[i];
		if(cookie.getName().equals("userInfo")){
			userInfo=cookie.getValue();
			quit = request.getParameter("quit");
			if (quit != null){
				cookie = new Cookie("userInfo", userType + "," + uid + ","+ name);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				userInfo = null;
			}
			break;
		}
	} 
 	if(userInfo == null || userInfo.trim().equals("")){ 
 		userType = request.getParameter("usertype");
 		if (userType == null || userType.trim().equals("")){
 			%>
    		<jsp:forward page="login/user_login.jsp">
		       	<jsp:param name="warning" value="none" />
		    </jsp:forward>
		    <%
 		}
 		else{
 			userID = request.getParameter("userid");
 			password = request.getParameter("password");
 			idType = userType + "ID";
 			sql="SELECT " + idType + ", name, password FROM " + userType;
 			DBHelper.getConnection();
 			ResultSet rs = DBHelper.Query(sql);
 			if (userID != null && password != null){
				while(rs.next()){
 			         uid = rs.getString(idType);
 			         name = rs.getString("name");
 			         pwd = rs.getString("password");
 			         if (uid.equals(userID)){
 			        	 if(pwd.equals(password)){
 			        		 loggedin=true;
 			        		 break;
 			        	 }
 			        	 else{
 			        		 passwordError = true;
 			        	 }
 			         }
 			         else{
 			        	 usernameError = true;	 
 			         }
 			    }
 			}
 		}
 	} 
 	else{
		userInfoList = userInfo.split(",");
		userType = userInfoList[0];
		uid = userInfoList[1];
		name = userInfoList[2];
		loggedin = true;
	} 
	if (loggedin == false){
		if (usernameError == true){
			%>
       		<jsp:forward page="login/user_login.jsp">
 		       	<jsp:param name="warning" value="user" />
 		    </jsp:forward>
 		    <%
		}
		else if (passwordError == true){
			%>
       		<jsp:forward page="login/user_login.jsp">
 		       	<jsp:param name="warning" value="pass" />
 		    </jsp:forward>
 		    <%
		}
	}
	else{
		cookie = new Cookie("userInfo", userType + "," + uid + ","+ name);
		cookie.setMaxAge(Integer.MAX_VALUE); 
 		response.addCookie(cookie); 
		
		if(userType.equals("student")){
			%>
			<jsp:forward page="manage/student.jsp">
				<jsp:param name="userid" value="<%=uid%>" />
				<jsp:param name="username" value="<%=name%>" />
		    </jsp:forward>
	    	<%
		}
		else if(userType.equals("teacher")){
			%>
			<jsp:forward page="manage/teacher.jsp">
				<jsp:param name="userid" value="<%=uid%>" />
				<jsp:param name="username" value="<%=name%>" />
		    </jsp:forward>
	    	<%
		}
		else{
			out.println("你到底是个神马？");
		}
	}
	%>
