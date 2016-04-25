<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>About</title>
		<link href="/SSM/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="/SSM/css/ssm.css" rel="stylesheet"/>
		<link href="/SSM/css/changepwd.css" rel="stylesheet"/>
		<link href="/SSM/css/about.css"/>
	</head>

	<body class="table-responsive" style="background-color:#EEE">
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
					<h1>大学生毕业推荐系统</h1>
					<h4>事业无穷年  —— 韩愈</h4>
				</hgroup>
			</div>
		</div>
		
		<!-- 关于部分 -->
		<div id="about">
			<div class="container">
				<div class="row">
					<div class="col-md-3 hidden-sm hidden-xs">
						<div class="list-group">
							<a class="list-group-item" href="#1">1.机构介绍</a>
							<a class="list-group-item" href="#2">2.加入我们</a>
							<a class="list-group-item" href="#3">3.联系方式</a>
						</div>
					</div>
					<div class="col-md-9 about">
						<a name="1"></a>
						<h3>平台简介</h3>
						<p>大学毕业生推荐系统是以为学生服务为理念，秉着为广大学生才子服务。网络已深刻改变着人们的生活，本地化生活服务市场前景巨大，生活半径 团队坚信本地化生活服务与互联网的结合将会成就一家梦幻的公司，我们脚踏实地的相信梦 想，我们相信你的加入会让生活半径更可能成为那家梦幻公司！生活半径人有梦想，有魄力， 强执行力，但是要实现这个伟大的梦想，需要更多的有创业精神的你一路前行。公司将提供 有竞争力的薪酬、完善的福利（五险一金）、期权、广阔的上升空间。只要你有能力、有激 情、有梦想，愿意付出，愿意与公司共同成长，请加入我们！
						</p>
						<a name="2"></a>
						<h3>加入我们</h3>
						<p>网络已深刻改变着人们的生活，本地化生活服务市场前景巨大，生活半径 团队坚信本地化生活服务与互联网的结合将会成就一家梦幻的公司，我们脚踏实地的相信梦 想，我们相信你的加入会让生活半径更可能成为那家梦幻公司！生活半径人有梦想，有魄力， 强执行力，但是要实现这个伟大的梦想，需要更多的有创业精神的你一路前行。公司将提供 有竞争力的薪酬、完善的福利（五险一金）、期权、广阔的上升空间。只要你有能力、有激 情、有梦想，愿意付出，愿意与公司共同成长，请加入我们！
						</p>
						<p>请发送您的简历到：332068039@qq.com，我们会在第一时间联系您！</p>
						<a name="3"></a>
						<h3>联系方式</h3>
						<p>地址：湖南省株洲市天元区湖南工业大学</p>
						<p>邮编：412007</p>
						<p>电话：010-88888888</p>
						<p>传真：010-88666666</p>
					</div>
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
		<script src="/SSM/js/vue.js"></script>
		<script src="/SSM/js/SSM.js"></script>
		<script src="/SSM/js/vuejs.js"></script>
	</body>

</html>