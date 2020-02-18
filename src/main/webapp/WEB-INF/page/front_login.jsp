<%--
  Created by IntelliJ IDEA.
  User: 127
  Date: 2019/12/25
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
%>
<html>
<head>
	<title>用户登录</title>
	<link rel="stylesheet" href=<%=path+"resources/layui/css/layui.css"%>>
	<script src=<%=path+"resources/layui/layui.js"%>></script>
<%--	<script src="../resources/jquery/jquery-3.4.1.js"></script>--%>
</head>
<body style="height:100%;background-color:#2F4056">

<form hidden>
	<input type="hidden" id="path" value=<%=path%>>
</form>

	<%--    登录界面  --%>
	<div class="layui-form-item" style="padding-top: 200px;padding-left: 400px;">
		<form action=<%=path+"BaseController/toPage/front_userinfo"%> method="post" class="layui-form" id="logform">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="uaccount" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码框</label>
				<div class="layui-input-inline">
					<input type="password" name="upassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="login">登录</button>
					<button type="button" class="layui-btn" id="toreg">注册账号</button>
				</div>
			</div>
		</form>
	</div>

	<%--    注册界面    --%>
	<div style="display:none;" id="regdiv">
		<form method="post" class="layui-form" id="regform">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="uaccount" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="password" name="upassword" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-inline">
					<input type="password" name="passwordsure" required lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input type="radio" name="usex" value="男" title="男" checked="">
					<input type="radio" name="usex" value="女" title="女">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">学历</label>
				<div class="layui-input-inline">
					<select name="uedu" lay-filter="aihao">
						<option value=""></option>
						<option value="小学">小学</option>
						<option value="初中">初中</option>
						<option value="高中">高中</option>
						<option value="大学">大学</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">职业</label>
				<div class="layui-input-inline">
					<select name="uocc" lay-filter="aihao">
						<option value=""></option>
						<option value="学生">学生</option>
						<option value="医生">医生</option>
						<option value="厨师">厨师</option>
						<option value="教师">教师</option>
						<option value="司机">司机</option>
						<option value="其他">其他</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">验证手机</label>
					<div class="layui-input-inline">
						<input type="tel" name="uphone" lay-verify="required|phone" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">验证邮箱</label>
					<div class="layui-input-inline">
						<input type="text" name="uemail" lay-verify="email" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="reg">注册</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		//用户登录
		layui.use(['form','jquery','layer'], function(){
			var form = layui.form;
			var $ = layui.jquery;
			var layer = layui.layer;
			var path = $("#path").val();

			// 登录监听提交
			form.on('submit(login)', function(data){
				layer.msg(JSON.stringify(data.field));
				$.ajax({
					type:"POST",
					url:path+'UserController/login',
					dataType:"text",
					data:data.field,
					success:function (msg) {
						if (msg==="登录成功"){
							layer.msg("登录成功,自动跳转中...",{time:1000},function () {
								$("#logform")[0].submit();
							});
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

			//打开注册界面
			$("#toreg").click(function () {
				layer.open({
					type:1,
					title:"注册",
					content:$("#regdiv"),
					area:['400px','auto'],
					success:function (index) {
						$("#regform")[0].reset();
					}
				});

			});

			//用户注册
			form.on('submit(reg)', function(data){
				layer.msg(JSON.stringify(data.field));
				$.ajax({
					type:"POST",
					url:path+'UserController/reg',
					dataType:"text",
					data:data.field,
					success:function (msg) {
						layer.msg(msg)
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
