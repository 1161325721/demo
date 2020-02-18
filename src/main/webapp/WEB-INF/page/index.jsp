<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath() + "/";
%>
<html>
<head>
	<title>主页</title>
	<link rel="stylesheet" href=<%=path+"resources/layui/css/layui.css"%> >
	<script src=<%=path+"resources/layui/layui.js"%>></script>
</head>
<body>

<ul class="layui-nav" lay-filter="">
	<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/front_login"%>>用户端</a></li>
	<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/back_login"%>>管理端</a></li>
</ul>




</body>
</html>