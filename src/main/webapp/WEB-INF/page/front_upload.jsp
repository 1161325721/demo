<%--
  Created by IntelliJ IDEA.
  User: 127
  Date: 2019/12/29
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path = application.getContextPath()+"/";
%>
<html>
<head>
	<title>上传文件</title>
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

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		<legend>文件上传</legend>
	</fieldset>

	<%--上传按钮--%>
	<div class="layui-upload">
		<form action="" method="post" class="layui-form">
			<div class="layui-form-item">
				<button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>选择文件</button>
			</div>
			<div class="layui-form-item">
				<button type="button" class="layui-btn" id="test9">开始上传</button>
			</div>
		</form>
	</div>

	<%--上传文件信息--%>
	<div>
		<form action="" method="post" class="layui-form" id="fileinfo" lay-filter="fileinfo">
			<div class="layui-form-item">
				<label class="layui-form-label">文件名：</label>
				<div class="layui-input-inline">
					<input type="text" name="filename" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">文件大小(Byte)：</label>
				<div class="layui-input-inline">
					<input type="text" name="filesize" class="layui-input" style="border-style: none" disabled>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">文件描述：</label>
				<div class="layui-input-inline">
					<input type="text" name="fileinfo" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">下载积分：</label>
				<div class="layui-input-inline">
					<input type="text" name="filescore" class="layui-input">
				</div>
			</div>
		</form>
	</div>

	<script>
		layui.use(['upload','form'], function(){
			var $ = layui.jquery
				,upload = layui.upload;
			var form = layui.form;
			var fileinfo;
			var path = $("#path").val();
			//选完文件后不自动上传
			upload.render({
				elem: '#test3'
				,url: path+'FileController/uploadFile'
				,accept: 'file'
				,auto: false
				,bindAction: '#test9'
				,choose: function(obj){
					//预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
					obj.preview(function(index, file, result){
						fileinfo = {
							filename:file.name,
							filesize:file.size
						};
						form.val("fileinfo",fileinfo);
					});
				}
				,before: function(obj){
					this.data = form.val("fileinfo");
					alert(JSON.stringify(form.val("fileinfo")));
				}
				,done: function(res){
					alert(JSON.stringify(res));
				}
			});

		});
	</script>
</body>
</html>
