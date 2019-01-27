<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="Css/style.css" />
    <script type="text/javascript" src="Js/jquery.js"></script>
    <script type="text/javascript" src="Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="Js/bootstrap.js"></script>
    <script type="text/javascript" src="Js/ckform.js"></script>
    <script type="text/javascript" src="Js/common.js"></script>
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
    <script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>
</head>
<body>

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
<form action="http://localhost:8080/QnSystem//IncreaseProbems" method="post">
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">题目</td>
        <td><input type="text" name="problem"/></td>
    </tr>
    <tr>
        <td class="tableleft">选项A</td>
        <td><input type="text" name="selecta"/></td>
    </tr>   
    <tr>
        <td class="tableleft">选项B</td>
        <td><input type="text" name="selectb"/></td>
    </tr>
    <tr>
        <td class="tableleft">选项C</td>
        <td><input type="text" name="selectc"/></td>
    </tr>
    <tr>
        <td class="tableleft">选项D</td>
        <td><input type="text" name="selectd"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
        </td>
    </tr>
</table>
</form>
</body>
</html>
