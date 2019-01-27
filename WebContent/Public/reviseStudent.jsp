<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>后台管理系统</title>   
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 300px;
            padding: 19px 29px 29px;
            margin: 0 auto 20px;
            background-color: #fff;
            border: 1px solid #e5e5e5;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin input[type="text"],
        .form-signin input[type="password"] {
            font-size: 16px;
            height: auto;
            margin-bottom: 15px;
            padding: 7px 9px;
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
    String id = request.getParameter("id");//用request得到
    ///int intid = Integer.parseInt(id); //可能会有错误但是我们先不用转换
    //out.print(id);
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
        String query_sql = "select * from student where stu_id = "+id;
        try {
            ResultSet rs = stmt.executeQuery(query_sql);
            rs.next();
%>
<div class="container">

    <form class="form-signin" method="post" action="reviseStudentservs.jsp">
        <h2 class="form-signin-heading">信息修改</h2>
        <input type="text" name="studentid" style="display:none" class="input-block-level" placeholder="账号" value="<%=rs.getString("stu_id")%>">
        Country:<input type="text" name="country" value="China" readonly="readonly" />
        <input type="text" name="username" class="input-block-level" placeholder="name" value="<%=rs.getString("stu_name")%>">
        <input type="text" name="studentpsw" class="input-block-level" placeholder="密码" value="<%=rs.getString("stu_psw")%>">
        <input type="text" name="studentstate" class="input-block-level" placeholder="状态" value="<%=rs.getString("state")%>">
        <p><button class="btn btn-large btn-primary" type="submit">修改</button></p>
    </form>

</div>
<%
        }catch(Exception e) {
            e.printStackTrace();
        }
        stmt.close();
        conn.close();
    }catch (Exception e) {
        e.printStackTrace();
    }


%>
</body>
</html>