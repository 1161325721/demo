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
	<title>文件下载</title>
	<link rel="stylesheet" href=<%=path+"resources/layui/css/layui.css"%>>
	<script src=<%=path+"resources/layui/layui.js"%>></script>
</head>
<body>

	<%--工程路径--%>
	<form hidden>
		<input type="hidden" id="path" value=<%=path%>>
	</form>

	<ul class="layui-nav" lay-filter="">
		<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_index">主页</a></li>
		<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_userinfo">用户信息</a></li>
		<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_upload">上传文件</a></li>
		<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_userfile">用户文件</a></li>
		<li class="layui-nav-item"><a href="UserServlet?method=toWebPage&pageName=front_download">文件下载</a></li>
	</ul>
<%--用户文件--%>

		<%--	查询条件--%>
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;" >
			<legend>搜索条件</legend>
		</fieldset>
		<form action="" class="layui-form" method="post" id="condition" lay-filter="condition">

			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">文件名：</label>
					<div class="layui-input-inline">
						<input type="text" name="filename" lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button type="button" class="layui-btn layui-btn-sm" lay-filter="demo1" id="search">搜索</button>
					<button type="reset" class="layui-btn layui-btn-sm">重置</button>
				</div>
			</div>
		</form>


		<%--用户列表    --%>
		<table id="demo" lay-filter="test" class="layui-table"></table>

		<%--操作栏   --%>
		<div style="display: none" id="tableBar">
			<div class="layui-btn-group">
				<a class="layui-btn layui-btn-xs" lay-event="download">下载</a>
			</div>
		</div>

		<script>
			layui.use(['table','form','jquery','laydate'], function(){

				var table = layui.table;
				var form = layui.form;
				var $ = layui.jquery;
				var laydate = layui.laydate;
				var path = $("#path").val();
				var cond;

				//第一个实例
				table.render({
					elem: '#demo'
					,height: 300
					,limit:10
					,url: path+'BackController/reqFileList' //数据接口
					// ,toolbar: '#tabToolBar'
					,page: true //开启分页
					,where: { //设定异步数据接口的额外参数，任意设
						condition:function () {
							var con = {filestate:"审核通过"};
							return JSON.stringify(con);
						}
					}
					,cols: [[ //表头
						{field: 'fileid', title: '文件ID', width:100, sort: true, fixed: 'left'}
						,{field: 'filename', title: '文件名', width:80}
						,{field: 'filetype', title: '类型', width:80}
						,{field: 'filesize', title: '大小', width:80}
						,{field: 'filedate', title: '时间', width:180}
						,{field: 'filestate', title: '状态', width:100}
						,{field: 'filescore', title: '下载积分', width:80}
						,{field: 'fileinfo', title: '文件信息', width:100}
						,{fixed: 'right', title:'操作', toolbar: '#tableBar', width:180}
					]]
				});

				//监听行工具事件
				table.on('tool(test)', function(obj){
					var fdata = obj.data;
					//console.log(obj)
					if(obj.event === 'ban'){

					} else if(obj.event === 'ok'){


					}
				});

				$("#search").click(function () {

					cond = form.val("condition");
					cond.filename = "%"+cond.filename+"%";
					alert(JSON.stringify(cond));
					table.reload('demo', {
						 url: path+'BackController/reqFileList' //数据接口
						,where: { //设定异步数据接口的额外参数，任意设
							condition:JSON.stringify(cond)
						}
						,page: {
							curr: 1 //重新从第 1 页开始
						}
					}); //只重载数据

				});


			});
		</script>


</body>
</html>
