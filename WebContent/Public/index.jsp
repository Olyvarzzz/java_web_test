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
<body  background="img/in2bg.jpg" >
<%

        Connection conn;
        String tao_id = request.getParameter("tao_id");//用request得到
        String username = request.getParameter("usernamedb");
		if(tao_id == null){
			tao_id = "1";
		}
/** 连接数据库参数 **/
        String CLASSFROENAME = "com.mysql.jdbc.Driver";
        String SERVANDDB = "jdbc:mysql://118.24.83.200:3306/Transfer";
        String USERNAME = "xhsfct";
        String PASSWORD = "123456";
        Class.forName(CLASSFROENAME);
        conn = DriverManager.getConnection(SERVANDDB,USERNAME,PASSWORD);
        Statement stmt1 = conn.createStatement();
        stmt1.executeQuery("SET NAMES UTF8");
        try {
        String query_sql = "select DISTINCT tao_id from problems";

            ResultSet rs = stmt1.executeQuery(query_sql);
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
         <td nowrap="nowrap"><a href="http://localhost:8080/QnSystem/Public/index.jsp?usernamedb=<%=username%>&tao_id=<%=rs.getString("tao_id")%>">第<%=rs.getString("tao_id")%>套</a></td>
         </tr>   
<%}

%>
     </tbody>
   </table>  
   <%
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        
        String query_sql = "SELECT pro_name,pro_select_a,pro_select_b,pro_select_c,pro_select_d FROM problems WHERE tao_id = "+tao_id;
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query_sql);
            int i=1;
%>
<hr><form method="post" action="indexservse.jsp">
<input type="text" name="username" class="input-block-level" style= display:none value="<%=request.getParameter("usernamedb") %>" >
<input type="text" name="tao_id" class="input-block-level" style= display:none value="<%=tao_id %>" >
<%
            while(rs.next()) {
        
%>
<div style="margin-left: 400px;line-height: 30px;"  >
<b>第<% out.println(i);%>题：<%=rs.getString("pro_name")%> </b>
</div>
    <table class="table table-bordered table-hover definewidth m10" style="width:800px;">
    <thead>
    <tr>
        <th>选项</th>
        <th style="width: 280px;">你的选择</th>
    </tr>
    </thead>
	     <tr style="background-color:#F9F9FA;">
            <td><%=rs.getString("pro_select_a")%></td>

            <td> <input  type="radio" name="Question<%=i %>" value="a"/>a</td>
        	</tr>
       <tr style="background-color:#F9F9FA;">
            <td><%=rs.getString("pro_select_b")%></td>
            <td><input  type="radio" name="Question<%=i %>" value="b"/>b</td>
        </tr>
      <tr style="background-color:#F9F9FA;">
            <td><%=rs.getString("pro_select_c")%></td>
            <td><input  type="radio" name="Question<%=i %>" value="c"/>c</td>
        </tr>
        	<tr style="background-color:#F9F9FA;">
            <td><%=rs.getString("pro_select_d")%></td>
            <td><input  type="radio" name="Question<%=i %>" value="d"/>d</td>
        	</tr>
        	
        </table>
    <hr>
        <%
        i++;
            }%>
         <div  style="text-align:center">
      <p><button class="btn btn-large btn-primary" type="submit">提交</button></p>
       </div>
   </form>
            
        
<%
		stmt.close();
		conn.close();
        }catch(Exception e) {
            e.printStackTrace();
        }
%> 		

</body>
</html>