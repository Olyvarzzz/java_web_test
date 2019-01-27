<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<%--公用模块  用来显示错误的信息--%>
<%
 String msg = (String) request.getAttribute("msg");
 %>
<%
 if (msg == null || msg==null){
     msg = "1";
 }
%>
<script>
    window.onload =function (ev) {
        var  mag ="<%=msg%>";
        console.log(mag);
        if (mag=="1"){
            console.log(mag);
        }else{
            alert(mag);
        }
    }

</script>
				
<%

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
        stmt.executeQuery("SET NAMES UTF8");
        String query_sql = "select * from student";
        try {
            ResultSet rs = stmt.executeQuery(query_sql);
          %>
   
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>用户名</th>
	<th>专业</th>
        <th>操作</th>
     <%
            while(rs.next()) {
%>
     

    </tr>
    </thead>
	     <tr>
            <td><%=rs.getString("stu_id")%></td>
            <td><%=rs.getString("stu_name")%></td>
            <td><%=rs.getString("stu_psw")%></td>
			 <td><%=rs.getString("state")%></td>
            <td> <a href="deleteStudent.jsp?id=<%=rs.getString("stu_id")%>">删除</a> <a href="reviseStudent.jsp?id=<%=rs.getString("stu_id")%>">编辑</a></td>

        </tr>
        <%
            }%>
        
		</table>
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