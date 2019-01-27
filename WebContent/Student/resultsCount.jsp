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
				
<%
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
String tao_id = request.getParameter("tao_id");//用request得到
System.out.println(tao_id +"idshuc");
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
        String query_sql = "SELECT pro_name,pro_select_a,pro_select_b,pro_select_c,pro_select_d FROM problems WHERE tao_id = "+tao_id;
        try {
            ResultSet rs = stmt.executeQuery(query_sql);
			int countarr [ ][ ]  = new int [100][4];
			for(int j = 1 ;j<=10; j++){
				String res = "res_"+""+j;
			 	String sql2 = "select count("+res+"='a' OR NULL) as nummbe1, count("+res+"='b' OR NULL )as nummbe2, count("+res+"='c' OR NULL )as nummbe3, count("+res+"='d' OR NULL )as nummbe4 from result where tao_id="+tao_id;
			 	Statement stmt2 = conn.createStatement();
			 	ResultSet rs1 = stmt2.executeQuery(sql2);
			 	rs1.next();
			 	countarr[j-1][0] =Integer.parseInt(rs1.getString("nummbe1")) ;
			 	countarr[j-1][1] =Integer.parseInt(rs1.getString("nummbe2")) ;
			 	countarr[j-1][2] =Integer.parseInt(rs1.getString("nummbe3")) ;
			 	countarr[j-1][3] =Integer.parseInt(rs1.getString("nummbe4")) ;		
			}
%>	
			
			<form class="form-inline definewidth m20" action="index.html" method="get">    

		    <br />
		</form>
		<table class="table table-bordered table-hover definewidth m10">			
<% 
    int i =1;
            while(rs.next()) {
            	int sum = countarr[i-1][0]+countarr[i-1][1]+countarr[i-1][2]+countarr[i-1][3];
            	if(sum == 0) sum = 1;
%>
<b>第<% out.println(i);%>题：<%=rs.getString("pro_name")%> </b>
    <table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>选项</th>
        <th>小计</th>
        <th>比例</th>
    </tr>
    </thead>
	     <tr>
            <td><%=rs.getString("pro_select_a")%></td>
            <td><%=countarr[i-1][0]%></td>
            <td><%=countarr[i-1][0]+"/"+sum %></td>
        </tr>
        	     <tr>
            <td><%=rs.getString("pro_select_b")%></td>
            <td><%=countarr[i-1][1]%></td>
            <td><%=countarr[i-1][1]+"/"+sum%></td>
        </tr>
        	     <tr>
            <td><%=rs.getString("pro_select_c")%></td>
            <td><%=countarr[i-1][2]%></td>
            <td><%=countarr[i-1][2]+"/"+sum%></td>
        </tr>
        	     <tr>
            <td><%=rs.getString("pro_select_d")%></td>
            <td><%=countarr[i-1][3]%></td>
            <td><%=countarr[i-1][3]+"/"+sum%></td>
        </tr>

        
        </table>
    <hr>
        <%
        i++;
            }%>
        

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
	tao_id ="";
%> 		

</body>
</html>