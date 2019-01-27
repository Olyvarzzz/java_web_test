<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("username");//用request得到
String password = request.getParameter("userpsw");
System.out.println(name);
if(name ==null || name==""){
	response.sendRedirect("http://localhost:8080/QnSystem/Public/login.html");
}else if(password == null ||password==""){
	response.sendRedirect("http://localhost:8080/QnSystem/Public/login.html");
}else{
    Connection conn;
	String CLASSFROENAME = "com.mysql.jdbc.Driver";
    String SERVANDDB = "jdbc:mysql://118.24.83.200:3306/Transfer";
    String USERNAME = "xhsfct";
    String PASSWORD = "123456";
    Class.forName(CLASSFROENAME);
    conn = DriverManager.getConnection(SERVANDDB,USERNAME,PASSWORD);
    Statement stmt = conn.createStatement();
    String sql = "select * from student where stu_name='"+name+"' and stu_psw='"+password+"'";
    System.out.println(sql);
    ResultSet rs = stmt.executeQuery(sql);
	    if(rs.next()){
	   
		//登陆成功
		request.setAttribute("usernamedb", rs.getString("stu_name"));
	    		response.sendRedirect("http://localhost:8080/QnSystem/Public/index.jsp?usernamedb="+rs.getString("stu_name"));
			}else{
			//登陆失败请重新输入用户名和密码！
			
			response.sendRedirect("http://localhost:8080/QnSystem/Public/login.html");
			}
}
%>
	
</body>
</html>