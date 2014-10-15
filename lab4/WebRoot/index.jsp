<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.*" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Book</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <div>Lab2</div><br><br><br><br>
  	<form method = "get" action = "">
  		作者名字:<input type = "text" name = "authorname">
  		<input type = "submit" value = "提交">
  		<input type = "reset" value = "重置">
  	</form>
  	
  		<form method = "get" action = "delete.jsp">
  		删除书籍(ISBN)：<input type = "text" name = "isbn"><br>
  		<input type = "submit" value = "删除">
  		<input type = "reset" value = "重置">
  	</form>
  	
  	<form method = "get" action = "addbook.jsp">
  		<input type = "submit" value = "添加"><br>
  	</form>
  	
  	<br><br><br><br><br>
  	
  	<jsp:useBean id = "conn" class = "bean.ConnBean"/>
  	<jsp:setProperty name = "conn" property="*"/>
  	<%
  		try{
  		Connection Conn = (Connection) conn.getConnection();
  		if (Conn == null) {
			      System.err.println("警告: DbConnectionManager.getConnection() 获得数据库链接失败.");
			}
	      	
	      	String sql = "";
		    String authorname = request.getParameter("authorname");
		    int authorid = 0;
		    sql = "select * from author where name = \""+ authorname +"\"";
			Statement stmt = (Statement) Conn.createStatement();
			ResultSet rs = null;
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				out.print("作者信息："+"<br>");
				out.print("authorid："+rs.getInt(1)+"<br>");
				out.print("name："+rs.getString(2)+"<br>");
				out.print("date of birth："+rs.getLong(3)+"<br>");
				out.print("country："+rs.getString(4)+"<br>");
				authorid = rs.getInt(1);
			}
			
			sql = "select * from book where authorid = "+ authorid +"";
			rs = stmt.executeQuery(sql);
			out.print("<br>"+"<br>"+"<br>"+"图书信息：");
			while(rs.next()){
				out.print("isbn："+rs.getLong(1)+"<br>");
				out.print("title："+rs.getString(2)+"<br>");
				out.print("authorid："+rs.getInt(3)+"<br>");
				out.print("publisher："+rs.getString(4)+"<br>");
				out.print("publishdate："+rs.getString(5)+"<br>");
				out.print("price："+rs.getFloat(6)+"<br>");
				out.print("------------------------------------"+"<br>");
			}
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					Conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
			
	    }
	    catch (Exception ee) {
	      ee.printStackTrace();
	    }
 	%>
  	
  	
  
  </body>
</html>
