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

		<%--	查询条件--%>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
			<legend>搜索条件</legend>
		</fieldset>
		<form action="" class="layui-form" method="post">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">验证日期</label>
					<div class="layui-input-inline">
						<input type="text" name="date" id="startdate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">至</label>
					<label class="layui-form-label"></label>
					<div class="layui-input-inline">
						<input type="text" name="date" id="enddate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">文件类型</label>
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
				<label class="layui-form-label">文件状态</label>
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
				<div class="layui-input-block">
					<button class="layui-btn layui-btn-sm" lay-filter="demo1">搜索</button>
					<button type="reset" class="layui-btn layui-btn-sm">重置</button>
				</div>
			</div>
		</form>


		<%--用户列表    --%>
		<table id="demo" lay-filter="test"></table>

<%--		&lt;%&ndash;操作栏   &ndash;%&gt;--%>
<%--		<div style="display: none" id="tableBar">--%>
<%--			<div class="layui-btn-group">--%>
<%--				<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
<%--				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
<%--			</div>--%>
<%--		</div>--%>

		<script>
			var path;
			layui.use(['table','form','jquery'], function(){
				var table = layui.table;
				var form = layui.form;
				var $ = layui.jquery;
				path = $("#path").val();
				//第一个实例
				table.render({
					elem: '#demo'
					,height: 300
					,limit:10
					,url: path+'UserController/reqUserFileList' //数据接口
					// ,toolbar: '#tabToolBar'
					,page: true //开启分页
					,cols: [[ //表头
						{field: 'fileid', title: '文件ID', width:80, sort: true, fixed: 'left'}
						,{field: 'filename', title: '文件名', width:80}
						,{field: 'filetype', title: '类型', width:80}
						,{field: 'filesize', title: '大小', width:80}
						,{field: 'filedate', title: '时间', width:80}
						,{field: 'filestate', title: '状态', width:80}
						,{field: 'filescore', title: '下载积分', width:80}
						,{field: 'fileinfo', title: '文件信息', width:80}
						// ,{fixed: 'right', title:'操作', toolbar: '#tableBar', width:150}
					]]
				});



			});
		</script>


</body>
</html>
