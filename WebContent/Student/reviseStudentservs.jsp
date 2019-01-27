<%--
  Created by IntelliJ IDEA.
  User: 36943
  Date: 19.1.11
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>deletStudent</title>
</head>
<body>

	<%
		String studentid = request.getParameter("studentid");
		String studentnae = request.getParameter("studentname");
		String studentpsw = request.getParameter("studentpsw");
		String studentstate = request.getParameter("studentstate");

		if ("".equals(studentpsw) || "".equals(studentstate)) {
			request.setAttribute("msg", "用户状态或密码为空！");
			request.getRequestDispatcher("reviseStudent.jsp?id=" + studentid).forward(request, response);
		} else {

			String id = request.getParameter("id");//用request得到
			///int intid = Integer.parseInt(id); //可能会有错误但是我们先不用转换
			out.print(id);
			try {
				/** 连接数据库参数 **/
				Connection conn;
				String CLASSFROENAME = "com.mysql.jdbc.Driver";
				String SERVANDDB = "jdbc:mysql://118.24.83.200:3306/Transfer?zeroDateTimeBehavior=convertToNull&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC&autoReconnect=true";
				String USERNAME = "xhsfct";
				String PASSWORD = "123456";
				Class.forName(CLASSFROENAME);
				conn = DriverManager.getConnection(SERVANDDB, USERNAME, PASSWORD);
				String query_sql = "update student set stu_psw='" + studentpsw + "',state='" + studentstate
						+ "'where stu_id='" + studentid + "'";
				System.out.println(query_sql);
				PreparedStatement stmt = conn.prepareStatement(query_sql);
				try {
					int rs = stmt.executeUpdate(query_sql);
					if (rs >= 1) {
						//正确
						request.setAttribute("msg", "修改正确！");
						request.getRequestDispatcher("studentlist.jsp").forward(request, response);
					} else {
						//错误
						request.setAttribute("msg", "修改错误！");
						request.getRequestDispatcher("studentlist.jsp").forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				//rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>
