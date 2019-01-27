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
        String query_sql = "select DISTINCT tao_id from problems";
        try {
            ResultSet rs = stmt.executeQuery(query_sql);
          %>
   
  

   
   <table class="table table-bordered table-striped table-hover">
     
       <tr align="center">
         <td nowrap="nowrap"><strong>题库</strong></td>
         <td nowrap="nowrap"><strong>第几套</strong></td>
         </tr>
     <tbody>
     
     <%
            while(rs.next()) {
%>
     
       <tr align="center">
         <td nowrap="nowrap"><%=rs.getString("tao_id")%></td>
         <td nowrap="nowrap"><a href="http://localhost:8080/QnSystem/Student/resultsCount.jsp?tao_id=<%=rs.getString("tao_id")%>">第<%=rs.getString("tao_id")%>套</a></td>
         </tr>
         
<%
            }%>

     </tbody>
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
        String query_sql = "select * from result";
        try {
            ResultSet rs = stmt.executeQuery(query_sql);
          %>
   
  

   
   <table class="table table-bordered table-striped table-hover">
     
       <tr align="center">
         <td nowrap="nowrap"><strong>姓名</strong></td>
         <td nowrap="nowrap"><strong>选项1</strong></td>
         <td nowrap="nowrap"><strong>选项2</strong></td>
         <td nowrap="nowrap"><strong>选项3</strong></td>
         <td><strong>选项4</strong></td>
         <td><strong>选项5</strong></td>
         <td><strong>选项6</strong></td>
         <td><strong>选项7</strong></td>
         <td><strong>选项8</strong></td>
         <td><strong>选项9</strong></td>
         <td><strong>选项10</strong></td>
         </tr>
     <tbody>
     <%
            while(rs.next()) {
%>
     
       <tr align="center">
         <td nowrap="nowrap"><%=rs.getString("stu_name")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_1")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_2")%></td>
         <td nowrap="nowrap"> <%=rs.getString("res_3")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_4")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_5")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_6")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_7")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_8")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_9")%></td>
         <td nowrap="nowrap"><%=rs.getString("res_10")%></td>      
         </tr>
         
<%
            }%>

     </tbody>
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
