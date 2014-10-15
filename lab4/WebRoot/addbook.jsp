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
    
    <title>addbook</title>
    
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
    <form name="authorfind"  action ="" method="post">
     	<table >
     	<tr>
     		<td>isbn：</td>
     		<td><input type = "text" name = "isbn" /></td>
     	</tr>
     	<tr>
     		<td>title：</td>
     		<td><input type = "text" name = "title" /></td>
     	</tr>
     	<tr>
     		<td>authorid：</td>
     		<td><input type = "text" name = "authorid" /></td>
     	</tr>
     	<tr>
     		<td>publisher：</td>
     		<td><input type = "text" name = "publisher" /></td>
     	</tr>
     	<tr>
     		<td>pulishdate：</td>
     		<td><input type = "text" name = "publishdate" /></td>
     	</tr>
     	<tr>
     		<td>price：</td>
     		<td><input type = "text" name = "price" /></td>
     	</tr>
     	<tr>
     		<td><input type = "submit" value = "提交" /></td>
     	</tr>
     	</table>
     </form>
     
     <jsp:useBean id = "add" class = "bean.AddBean"/>
  		<jsp:setProperty name = "add"  property="isbn"/>
  		<jsp:setProperty name = "add"  property="title"/>
  		<jsp:setProperty name = "add"  property="authorid"/>
  		<jsp:setProperty name = "add"  property="publisher"/>
  		<jsp:setProperty name = "add"  property="publishdate"/>
  		<jsp:setProperty name = "add"  property="price"/>
  	
  	<br><br><br><br><br><br>
  	您需要添加的书籍是：<br>
  		ISBN:<jsp:getProperty name = "add" property="isbn"/><br>
  		书名:<jsp:getProperty name = "add" property="title"/><br>
  		作者ID:<jsp:getProperty name = "add" property="authorid"/><br>
  		出版社:<jsp:getProperty name = "add" property="publisher"/><br>
  		出版日期:<jsp:getProperty name = "add" property="publishdate"/><br>
  		价格:<jsp:getProperty name = "add" property="price"/><br>
  		
  		<br><br><br><br><br>
  	<%
  		String sql = "";
  		 sql = add.add();
  		 out.print(sql);
  	%>
  </body>
</html>
