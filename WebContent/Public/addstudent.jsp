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
    <title>Title</title>
</head>
<body>

<%
        String username = request.getParameter("username");
        String password =request.getParameter("password");
        String alternative = request.getParameter("newpassword");
        System.out.println(password +"第一密码");
        System.out.println(alternative);
//        连接数据库
    /** 连接数据库参数 **/
    Connection conn;
    String CLASSFROENAME = "com.mysql.jdbc.Driver";
    String SERVANDDB = "jdbc:mysql://118.24.83.200:3306/Transfer";
    String USERNAME = "xhsfct";
    String PASSWORD = "123456";
    try{

                if(username==null||username==""){
                    request.setAttribute("msg", "用户名为空！");
                    request.getRequestDispatcher("add.jsp").forward(request, response);
                }else if(!password.equals(alternative)){
                    request.setAttribute("msg","两次密码不正确！");
                    request.getRequestDispatcher("add.jsp").forward(request, response);
                }else if(password ==null||password==""){
                    request.setAttribute("msg","用户密码为空!");
                    request.getRequestDispatcher("add.jsp").forward(request, response);
                }else{
                    Class.forName(CLASSFROENAME);
                    conn = DriverManager.getConnection(SERVANDDB,USERNAME,PASSWORD);
                    Statement stmt = conn.createStatement();
                    Statement stmt1 = conn.createStatement();
                    String sql1 ="select stu_name from student where stu_name='"+username+"'";
					System.out.println(sql1);
                    try {
                        ResultSet rs = stmt.executeQuery(sql1);
                            if (rs.next()){
                                request.setAttribute("msg","用户名重复!请重新输入用户名！");
                                request.getRequestDispatcher("add.jsp").forward(request, response);
                            }else{
                                String sql2 = "INSERT into student (stu_name,stu_psw,state) values ('"+username+"','"+password+"',1)";

                                int addrs = stmt.executeUpdate(sql2);
                                if(addrs>=1){
                                    //插入成功
                                    request.setAttribute("msg","恭喜，注册成功！");
                                    //跳转到登陆页面
                                    response.sendRedirect("http://localhost:8080/QnSystem/Public/login.html"); 
                                    request.getRequestDispatcher("login.html").forward(request, response);
                                   
                                }else{
                                    //插入失败 跳转到注册页面
                                    request.setAttribute("msg","错误异常！请联系管理员！");
                                    request.getRequestDispatcher("add.jsp").forward(request, response);
                                }
                            }

                        stmt1.close();
                        stmt.close();
                        conn.close();
                    }catch(Exception e) {
                        e.printStackTrace();
                    }
        }
//rs.close();
    }catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>
