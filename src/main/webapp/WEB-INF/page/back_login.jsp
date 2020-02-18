<%--
  Created by IntelliJ IDEA.
  User: 127
  Date: 2019/12/29
  Time: 17:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
%>
<html>
<head>
	<title>管理端登陆</title>
	<link rel="stylesheet" href=<%=path+"resources/layui/css/layui.css"%>>
	<script src=<%=path+"resources/layui/layui.js"%>></script>
</head>
<body>

	<form hidden>
		<input type="hidden" id="path" value=<%=path%>>
	</form>

<%--    登录界面  --%>
	<div class="layui-form-item" style="padding-top: 200px;padding-left: 400px;">
		<form action=<%=path+"BaseController/toPage/back_filemgr"%> method="post" class="layui-form" id="logform">
			<div class="layui-form-item">
				<label class="layui-form-label">管理员账号</label>
				<div class="layui-input-inline">
					<input type="text" name="manaccount" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码框</label>
				<div class="layui-input-inline">
					<input type="password" name="manpassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="login">登录</button>
				</div>
			</div>
		</form>
	</div>
<script>
	//Demo
	layui.use(['form','jquery','layer'], function(){
		var form = layui.form;
		var $ = layui.jquery;
		var layer = layui.layer;
		var path = $("#path").val();

		// 登录监听提交
		form.on('submit(login)', function(data){

			$.ajax({
				type:"POST",
				url:path+'BackController/backLogin',
				dataType:"text",
				data:data.field,
				success:function (msg) {
					if (msg==="登录成功"){
						layer.alert('登录成功', {
							icon: 1,
							skin: 'layer-ext-moon' //该皮肤由layer.seaning.com友情扩展。关于皮肤的扩展规则，去这里查阅
						});
						$("#logform")[0].submit();
					} else {
						layer.msg(msg);
					}
				},
				error:function () {
					alert("服务器正忙");
				}
			});

			return false;
		});


	});
</script>




</body>
</html>
