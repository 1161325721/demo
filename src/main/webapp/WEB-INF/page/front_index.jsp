<%--
  Created by IntelliJ IDEA.
  User: 127
  Date: 2019/12/29
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
%>
<html>
<head>
	<title>主页</title>
	<link rel="stylesheet" href="../resources/layui/css/layui.css">
	<script src="../resources/layui/layui.js"></script>
</head>
<body>
		<ul class="layui-nav" lay-filter="">
			<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_index">主页</a></li>
			<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_userinfo">用户信息</a></li>
			<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_upload">上传文件</a></li>
			<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_userfile">用户文件</a></li>
			<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_download">文件下载</a></li>
		</ul>
</body>
</html>
