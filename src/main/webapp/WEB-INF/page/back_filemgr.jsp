<%--
  Created by IntelliJ IDEA.
  User: 127
  Date: 2019/12/29
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<form hidden>
		<input type="hidden" id="path" value=<%=path%>>
	</form>

	<%--导航栏--%>
<%--	<div>--%>
<%--		<ul class="layui-nav" lay-filter="">--%>
<%--			<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/back_filemgr"%>>文件管理</a></li>--%>
<%--			<li class="layui-nav-item"><a href=<%=path+"BaseController/toPage/back_menumgr"%>>权限管理</a></li>--%>
<%--		</ul>--%>
<%--	</div>--%>

	<c:if test="${sessionScope.menuinfo != null}">
			<ul class="layui-nav" lay-filter="">
				<c:forEach items="${sessionScope.menuinfo}" begin="0" var="j">
					<li class="layui-nav-item"><a href="<%=path+"BaseController/toPage/"%>${j.menuurl}">${j.menuname}</a></li>
				</c:forEach>
			</ul>
	</c:if>


		<div>
			<ul class="layui-nav" lay-filter="">

			</ul>
		</div>


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
				<div class="layui-inline">
					<label class="layui-form-label">验证日期：</label>
					<div class="layui-input-inline">
						<input type="text" name="startdate" id="startdate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					</div>
					<label class="layui-form-label">至：</label>
					<div class="layui-input-inline">
						<input type="text" name="enddate" id="enddate" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">文件类型</label>
				<div class="layui-input-inline">
					<select name="filetype" lay-filter="aihao">
						<option value=""></option>
						<option value="sql">.sql</option>
						<option value="txt">.txt</option>
						<option value="pdf">.pdf</option>
					</select>
				</div>
				<label class="layui-form-label">文件状态</label>
				<div class="layui-input-inline">
					<select name="filestate" lay-filter="aihao">
						<option value=""></option>
						<option value="待审核">待审核</option>
						<option value="审核通过">审核通过</option>
						<option value="审核失败">审核失败</option>
					</select>
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
<%--				<a class="layui-btn layui-btn-xs" lay-event="download">下载</a>--%>
				<a class="layui-btn layui-btn-xs" lay-event="ok">审核通过</a>
				<a class="layui-btn layui-btn-xs" lay-event="ban">审核失败</a>
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

				table.render({
					elem: '#demo'
					,height: 300
					,limit:10
					,url: path+'BackController/reqFileList' //数据接口
					,page: true //开启分页
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
						layer.confirm('确认将该文件审核失败？', function(index){
							var sendData = {
								fileid:fdata.fileid,
								filestate:"审核失败"
							};

							$.ajax({
								type:"POST",
								url:path+'BackController/fileEdit',
								dataType:"text",
								data:{
									condition:JSON.stringify(sendData)
								},
								success:function (msg) {
									if (msg==="true"){
										layer.msg("操作成功");
										table.reload('demo', {
											url:path+'BackController/reqFileList' //数据接口
											,where: { //设定异步数据接口的额外参数，任意设
												condition:JSON.stringify(cond)
											}
										}); //只重载数据
										// obj.del();
										layer.close(index);
									} else {
										layer.msg("操作失败");
									}
								},
								error:function () {
									alert("服务器正忙");
								}
							});

						});
					} else if(obj.event === 'ok'){
						layer.confirm('确认将该文件审核通过？', function(index){
							// layer.msg(fdata.fileid);
							var sendData = {
								fileid:fdata.fileid,
								filestate:"审核通过"
							};

							$.ajax({
								type:"POST",
								url:path+'BackController/fileEdit',
								dataType:"text",
								data:{
									condition:JSON.stringify(sendData)
								},
								success:function (msg) {
									if (msg==="true"){
										layer.msg("操作成功");
										//只重载数据
										table.reload('demo', {
											url:  path+'BackController/reqFileList' //数据接口
											,where: { //设定异步数据接口的额外参数，任意设
												condition:JSON.stringify(cond)
											}
										});

										// obj.del();
										layer.close(index);
									} else {
										layer.msg("操作失败");
									}
								},
								error:function () {
									alert("服务器正忙");
								}
							});


						});
					}
				});

				$("#search").click(function () {
					cond = form.val("condition");
					cond.filename = "%"+cond.filename+"%";
					alert(JSON.stringify(cond));
					table.reload('demo', {
						 url:path+'BackController/reqFileList' //数据接口
						,where: { //设定异步数据接口的额外参数，任意设
							condition:JSON.stringify(cond)
						}
						,page: {
							curr: 1 //重新从第 1 页开始
						}
					}); //只重载数据

				});
				laydate.render({
					elem: '#startdate'
				});
				laydate.render({
					elem: '#enddate'
				});


			});
		</script>


</body>
</html>
