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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>这是一个调查问卷</h1>

<%
		String username = request.getParameter("username");
		String taoid =request.getParameter("tao_id");
		String alternative1 = request.getParameter("Question1");
		String alternative2 = request.getParameter("Question2");
		String alternative3 = request.getParameter("Question3");
		String alternative4 = request.getParameter("Question4");
		String alternative5 = request.getParameter("Question5");
		String alternative6 = request.getParameter("Question6");
		String alternative7 = request.getParameter("Question7");
		String alternative8 = request.getParameter("Question8");
		String alternative9 = request.getParameter("Question9");
		String alternative10 = request.getParameter("Question10");
		//System.out.println(username);
		//System.out.println(taoid);
		//System.out.println(alternative1);
		//System.out.println(alternative2);
		//System.out.println(alternative4);
try
    {
/** 连接数据库参数 **/
        Connection conn;
        String CLASSFROENAME = "com.mysql.jdbc.Driver";
        String SERVANDDB = "jdbc:mysql://118.24.83.200:3306/Transfer";
        String USERNAME = "xhsfct";
        String PASSWORD = "123456";
        Class.forName(CLASSFROENAME);
        conn = DriverManager.getConnection(SERVANDDB,USERNAME,PASSWORD);
        Statement stmt = conn.createStatement();
        String longsql = "INSERT INTO result(tao_id,stu_name,res_1,res_2,res_3,res_4,res_5,res_6,res_7,res_8,res_9,res_10)"+
        " VALUES("+taoid+",'"+username+"','"+alternative1+"','"+alternative2+"','"+alternative3+"','"+alternative4+"','"+alternative5+"'"+
        ",'"+alternative6+"','"+alternative7+"','"+alternative8+"','"+alternative9+"','"+alternative10+"')";
        System.out.println(longsql);
        try {
            int rs = stmt.executeUpdate(longsql);
            if(rs>=1){
            	//插入成功
    			response.sendRedirect("http://localhost:8080/QnSystem/Public/hell.jsp");
            }else{
            	 request.setAttribute("msg","插入失败！");
            	request.getRequestDispatcher("login.html").forward(request, response);
            }
%>
		

<%
        }catch(Exception e) {
            e.printStackTrace();
        }
//rs.close();
        stmt.close();
        conn.close();
    }catch (Exception e) {
        e.printStackTrace();
    }

%> 	
</body>
</html>