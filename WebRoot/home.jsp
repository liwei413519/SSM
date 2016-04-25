<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Home</title>
		<link href="/SSM/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="/SSM/css/ssm.css" rel="stylesheet"/>
	</head>

	<body>
		<!--
      	作者：332068039@qq.com
      	时间：2016-03-31
      	描述：响应式导航组件
      -->
		<%@ include file="/common/head.jsp" %>
        	
		<!--
    	作者：332068039@qq.com
    	时间：2016-03-31
    	描述：响应式轮播图
    -->
		<div id="myCarousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active" style="background: #223240;">
					<a href="http://www.retail-recruitment.bmw.zhaopin.com/index.htm"><img src="/SSM/img/ad1.jpg" alt="第一张图片" /></a>
				</div>
				<div class="item" style="background: #269ABC;">
					<a href="http://www.51testing.net/htm/zpwa/zhaopinbq.htm"><img src="/SSM//img/ad2.jpg" alt="第二张图片" /></a>
				</div>
				<div class="item" style="background: #269ABC;">
					<a href="http://www.boweifeng.com/htm/android2/zhaopinbq.htm"><img src="/SSM//img/ad3.jpg" alt="第三张图片" /></a>
				</div>
			</div>
			<a href="#myCarousel" data-slide="prev" class="carousel-control left">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a href="#myCarousel" data-slide="next" class="carousel-control right">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<!--
      	作者：332068039@qq.com
      	时间：2016-03-31
      	描述：主页消息部分
      	-->
		<div id="information">
			<div class="container">
				<div class="row">
					<div class="col-md-8 info-left">
						<div class="container-fluid" style="padding: 0;">
							<!-- 利用JSTL循环显示消息集合 -->
							<c:forEach var="job" items="${jobs }">
								<div class="row info-content">
								<div class="col-md-5 col-sm-5 col-xs-5">
									<img src="/SSM/img/info1.jpg" class="img-responsive" alt=".." />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7">
									<h4><a href="/SSM/job/jobdetail.do?jobid=${job.tJid}">${job.tJname }</a></h4>
									<p class="hidden-xs">${job.tJbody }
									</p>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							</c:forEach>
						</div>
						
					</div>
					<div class="col-md-4 info-right hidden-xs hidden-sm">
						<blockquote>
							<h2>热门资讯</h2>
						</blockquote>
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
									<img src="/SSM/img/info3.jpg" alt="..." class="img-responsive" />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
									<h4>标题</h4>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
									<img src="/SSM/img/info3.jpg" alt="..." class="img-responsive" />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
									<h4>标题</h4>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
									<img src="/SSM/img/info3.jpg" alt="..." class="img-responsive" />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
									<h4>标题</h4>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row">
								<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
									<img src="/SSM/img/info3.jpg" alt="..." class="img-responsive" />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
									<h4>标题</h4>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
						</div>
						
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
		<script src="/SSM/js/jquery-form.js"></script>
	</body>
</html>