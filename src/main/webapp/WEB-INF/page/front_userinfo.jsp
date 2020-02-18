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
	<link rel="stylesheet" href=<%=path+"resources/layui/css/layui.css"%>>
	<script src=<%=path+"resources/layui/layui.js"%>></script>
</head>
<body>

	<%--工程路径--%>
	<form hidden>
		<input type="hidden" id="path" value=<%=path%>>
	</form>

	<%--导航栏--%>
	<ul class="layui-nav" lay-filter="">
		<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/front_userinfo"%>>用户信息</a></li>
		<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/front_upload"%>>上传文件</a></li>
		<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/front_userfile"%>>用户文件</a></li>
		<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/front_download"%>>文件下载</a></li>
	</ul>

	<%--用户信息--%>
	<div>
		<form action="" method="post" class="layui-form" id="userInfoForm" lay-filter="userInfoForm">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名：</label>
				<div class="layui-input-inline">
					<input type="text" name="uaccount" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别：</label>
				<div class="layui-input-inline">
					<input type="text" name="usex" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学历：</label>
				<div class="layui-input-inline">
					<input type="text" name="uedu" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">职业：</label>
				<div class="layui-input-inline">
					<input type="text" name="uocc" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机：</label>
				<div class="layui-input-inline">
					<input type="text" name="uphone" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱：</label>
				<div class="layui-input-inline">
					<input type="text" name="uemail" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
		</form>
	</div>

	<script>
		layui.use(['jquery','form'], function(){
			var form = layui.form;
			var $ = layui.jquery;
			var path = $("#path").val();
			$.ajax({
				type:"POST",
				url:path+'UserController/reqUserinfo',
				dataType:"text",
				data:{},
				success:function (msg) {
					var data = JSON.parse(msg);
					// alert(msg);
					form.val("userInfoForm",data);
				},
				error:function () {
					alert("服务器正忙");
				}
			});
		});
	</script>


</body>
</html>
