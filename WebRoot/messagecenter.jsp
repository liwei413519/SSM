<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>PersonInf</title>
		<link href="/SSM/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="/SSM/css/ssm.css" rel="stylesheet"/>
		<link href="/SSM/css/bootstrap-table.css" rel="stylesheet" >
	</head>

	<body class="table-responsive">
		<!--
      	作者：332068039@qq.com
      	时间：2016-03-31
      	描述：响应式导航组件
      -->
		<%@ include file="/common/head.jsp" %>
		
		<!--
        	作者：332068039@qq.com
        	时间：2016-03-31
        	描述：子标题栏目
        -->
		<div class="jumbotron">
			<div class="container">
				<hgroup>
					<h1>${empty user.urealname?user.uname:user.urealname }<span>上次登录时间:${user.ulastlogintime} times:${user.ulogintimes}</span></h1>
					<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填写详细的信息可以获得更多的关注</h4>
				</hgroup>
			</div>
		</div>
        
        <!-- 管理消息通知 -->
        <div class="messages">
        	<div class="container">
        		<div class="row">
				<table id="table" 
					data-url="/SSM/msg/AjaxPage.do?toid=${user.uid }">
				</table>
			</div>
        	</div>
        </div>

		<!--
      	作者：332068039@qq.com
      	时间：2016-03-31
      	描述：foot部分
      	-->
		<%@include file="/common/foot.html" %>
		
		<script type="text/javascript" src="/SSM/js/prototype-1.6.0.3.js"></script>
		<script src="/SSM/js/jquery.min.js"></script>
		<script src="/SSM/js/bootstrap.min.js"></script>
		<script src="/SSM/js/bootstrap-table.js"></script>
		<script src="/SSM/js/vue.js"></script>
		<script src="/SSM/js/SSM.js"></script>
		<script src="/SSM/js/vuejs.js"></script>
		<script src="/SSM/js/jquery-form.js"></script>
		<script src="/SSM/js/messagecenter.js"></script>
	</body>

</html>