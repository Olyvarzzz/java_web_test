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
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
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
<body background="img/login-bg.jpg">
<%--公用模块  用来显示错误的信息--%>
<%
 String msg = (String) request.getAttribute("msg");
 %>
<%--out.println(<%=msg%>);--%>
<%
 if (msg == null){
     msg = "1";
 }
%>
<script>
    window.onload =function (ev) {
        var  mag ="<%=msg%>";
        if (mag=="1"){
            console.log(mag);
        }else{
            alert(mag);
        }
    }
</script>


<form action="addstudent.jsp" method="post" class="definewidth m20" style="margin-left: 500px;margin-top: 110px">
<table class="table table-bordered table-hover definewidth m10" style="width: 400px;">
    <tr>
        <td width="20%" class="tableleft">登录名</td>
        <td><input type="text" name="username"/></td>
    </tr>
    <tr>
        <td class="tableleft">密码</td>
        <td><input type="password" name="password"/></td>
    </tr>
    <tr>
        <td class="tableleft">重复密码</td>
        <td><input type="text" name="newpassword"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button" style="width:100px ">注册</button> &nbsp;&nbsp;
		
        </td>
    </tr>
</table>
</form>
</body>
</html>
