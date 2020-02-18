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
	<c:if test="${sessionScope.menuinfo != null}">
		<ul class="layui-nav" lay-filter="">
			<c:forEach items="${sessionScope.menuinfo}" begin="0" var="j">
				<li class="layui-nav-item"><a href="<%=path+"BaseController/toPage/"%>${j.menuurl}">${j.menuname}</a></li>
			</c:forEach>
		</ul>
	</c:if>

	<div id="test1"></div>
	<div class="layui-btn-container">
		<button type="button" class="layui-btn" lay-demotransferactive="getData">保存</button>
	</div>
	<script>
		layui.use(['table','form','jquery','laydate','transfer','util'], function(){

			var table = layui.table;
			var form = layui.form;
			var $ = layui.jquery;
			var transfer = layui.transfer;
			var laydate = layui.laydate;
			var path = $("#path").val();
			var cond;
			var util = layui.util;
			var a = new Array();;
			var b;
			$.ajax({
				type:"POST",
				url:path+'BackController/reqRoleMenuList',
				dataType:"text",
				data:{
					condition:JSON.stringify({roleid:"1"})
				},
				success:function (msg) {
					var roleData = JSON.parse(msg);




					for (var i = 0; i < roleData.length; i++) {
						var value = roleData[i].value;
						if (value!=undefined){
							// roleData[i].rolemunuid = ""+rolemenuid;
							a.push(roleData[i].menuid);
						}
					}
					console.log(a);

					//渲染
					transfer.render({
						elem: '#test1'  //绑定元素
						,title:['未分配菜单','已分配菜单']
						,id: 'demo1' //定义索引
						,parseData: function(res){
							return {
								"value": res.menuid //数据值
								,"title": res.title //数据标题
								,"disabled": res.disabled  //是否禁用
								,"checked": res.checked //是否选中
							}
						}
						,data:roleData
						,value:a
					});
				},
				error:function () {
					alert("服务器正忙");
				}
			});

			util.event('lay-demoTransferActive', {
				getData: function (othis) {
					var getData = transfer.getData('demo1'); //获取右侧数据
					// layer.alert(JSON.stringify(getData));
					var addList = new Array();
					var delList = new Array();
					var getDataValeList = new Array();
					for (var i in getData){
						getDataValeList.push(getData[i].value);
					}

					for (var i = 0; i < getData.length; i++) {


						var menuid = getData[i].value;
						if (a.indexOf(menuid)===-1){
							addList.push(menuid)
						}
					}

					for (var i = 0; i < a.length; i++) {
						if (getDataValeList.indexOf(a[i])===-1){
							delList.push(a[i]);
						}
					}
					console.log(getDataValeList);
					console.log(addList);
					console.log(delList);

					$.ajax({
						type:"POST",
						url:path+'BackController/menuEdit',
						dataType:"text",
						data:{
							condition:JSON.stringify({
								roleid:1,
								addList:addList,
								delList:delList
							})
						},
						success:function (msg) {
							// alert(msg);
							location.replace(location.href);
						},
						error:function () {
							alert("服务器正忙");
						}
					});

				}
			});
		});
	</script>




</body>
</html>
