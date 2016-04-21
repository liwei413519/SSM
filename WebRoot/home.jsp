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
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a href="#" class="navbar-brand" style="margin: 0;padding: 0;">
						<img src="/SSM/img/logo.png" title="<欢迎来到我的主页>" class="img-rounded" /></a>
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="/SSM/user/home.do"><span class="glyphicon glyphicon-home"></span> 首页</a></li>
						<c:choose>
							<c:when test="${user!=null}">
								<li class="dropdown" id="usermenu">
									<a href="#" id="welcome" data-toggle="dropdown" ><span class="dropdown-toggle glyphicon glyphicon-apple"></span> {{${user.utype}}} ${empty user.urealname?user.uname:user.urealname }<span class="caret"></span></a>
									<!-- 根据用户类型选择 Vue实现-->
									<ul class="dropdown-menu">
										<li v-for="menu in menus.${user.utype}">
											{{{menu.item}}}
										</li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="#" id="tologin">我的信息</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="#" id="tologinout"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
					</ul>
				</div>
			</div>
		</nav>
		
		<!--
        	作者：332068039@qq.com
        	时间：2016-04-11
        	描述：登录模态框
        -->
        <div class="modal fade" data-backdrop="static" tabindex="-1" id="loginmodal">
        	<!--窗口声明：-->
        	<div class="modal-dialog modal-lg">
        		<!-- 内容声明 -->
        		<div class="modal-content">
        			<!-- 头部 -->
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span>&times;</span>
        				</button>
        				<h4 class="modal-title text-warning text-center">我的信息</h4>
        				
        			</div>
        			<!-- 主体 -->
        			<div class="modal-body">
        				<form class="form-horizontal">
        					<div class="container-fluid">
        						<div class="col-md-5">
	        						<div class="row">
										<div class="col-lg-12 col-md-12  form-group">
											<span class="glyphicon glyphicon-apple control-label text-primary">&nbsp;用户名:</span>
											<input id="username" maxlength="16" type="text" class="form-control" placeholder="请输入用户名"/>
											<span id="userinf" class="hidden"></span>
										</div>
									</div>
									<div class="row ">
										<div class="col-lg-12 col-md-12 form-group">
				    						<span class="glyphicon glyphicon-book control-label text-primary">&nbsp;密   码:</span>
				    						<input id="password" maxlength="16" type="password" class="form-control pwd" placeholder="请输入密码"/>
				    						<span id="pwd1" class="hidden" style="color: #C9302C;"></span>
										</div>
									</div>
									<div class="row "> 
										<div class="col-lg-12 col-md-12 form-group">
											<a href="#" id="inputinf" data-toggle="popover"></a>
				    						<span class="glyphicon glyphicon-book control-label text-primary">&nbsp;确认密码:</span>
				    						<input id="repassword" maxlength="16" type="password" class="form-control pwd" placeholder="请再次输入密码"/>
				    						<span id="pwd2" class="hidden" style="color: #C9302C;"></span>
										</div>
									</div>
									
								</div>
								<div class="col-md-7  hidden-xs hidden-sm">
									<div class="container-fluid">
										<div class="row">
											<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
												<img src="/SSM/img/CSDN.jpg" alt="..." class="img-responsive" />
											</div>
											<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
												<h4 class="text-success"><a href="http://blog.csdn.net/" class="atip" data-original-title="Welocme to join us">CSDN</a></h4>
												<p class="text-primary">这是程序员的基地，我们可以在这里学习到有用的技术知识...</p>
											</div>
										</div>
										<div class="row">
											<div class="col-md-5 col-sm-5 col-xs-5" style="margin: 12px 0; padding-right: 0;">
												<img src="/SSM/img/BOOTSTRAP.PNG" alt="..." class="img-responsive" />
											</div>
											<div class="col-md-7 col-sm-7 col-xs-7" style="padding-right: 0;">
												<h4 class="text-success"><a href="http://www.bootcss.com/" class="atip" data-original-title="Welocme to join us">BootStrap</a></h4>
												<p class="text-primary">该系统使用的前台框架是BootStrap,非常强大的一个开源框架...</p>
											</div>
										</div>
									</div>
								</div>
							</div>
        				</form> 
        			</div>
        			<!-- 注脚 -->
        			<div class="modal-footer">
        				<div id="usertype" class="radio">
        					<label>
        						<input type="radio" name="usertype" value="m" /><span class="text-warning">管理员</span>
        					</label>
        					<label>
        						<input type="radio" name="usertype" value="e" /><span class="text-warning">个人企业</span>
        					</label>
        					<label>
        						<input type="radio" name="usertype" value="r" checked="checked"/><span class="text-warning">毕业生</span>
        					</label>
        				</div>
        				<button id="regbtn" type="button" class="btn btn-default">注册</button>
        				<button id="loginbtn" type="button" class="btn btn-primary">登录</button>
        			</div>
        		</div>
        	</div>
        </div>
        	
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
							<div class="row info-content">
								<div class="col-md-5 col-sm-5 col-xs-5">
									<img src="/SSM/img/info1.jpg" class="img-responsive" alt=".." />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7">
									<h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
									<p class="hidden-xs">TVOS2.0 是在TVOS1.0 与华 为MediaOS 及阿里巴巴YunOS 融合的基础上，打造的新一代智能电视操作系统。华为主要 承担开发工作，内置的电视购物商城由阿里方面负责。
									</p>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row info-content">
								<div class="col-md-5 col-sm-5 col-xs-5">
									<img src="/SSM/img/info1.jpg" class="img-responsive" alt=".." />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7">
									<h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
									<p class="hidden-xs">TVOS2.0 是在TVOS1.0 与华 为MediaOS 及阿里巴巴YunOS 融合的基础上，打造的新一代智能电视操作系统。华为主要 承担开发工作，内置的电视购物商城由阿里方面负责。
									</p>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row info-content">
								<div class="col-md-5 col-sm-5 col-xs-5">
									<img src="/SSM/img/info1.jpg" class="img-responsive" alt=".." />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7">
									<h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
									<p class="hidden-xs">TVOS2.0 是在TVOS1.0 与华 为MediaOS 及阿里巴巴YunOS 融合的基础上，打造的新一代智能电视操作系统。华为主要 承担开发工作，内置的电视购物商城由阿里方面负责。
									</p>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
							<div class="row info-content">
								<div class="col-md-5 col-sm-5 col-xs-5">
									<img src="/SSM/img/info1.jpg" class="img-responsive" alt=".." />
								</div>
								<div class="col-md-7 col-sm-7 col-xs-7">
									<h4>广电总局发布TVOS2.0 华为阿里参与研发</h4>
									<p class="hidden-xs">TVOS2.0 是在TVOS1.0 与华 为MediaOS 及阿里巴巴YunOS 融合的基础上，打造的新一代智能电视操作系统。华为主要 承担开发工作，内置的电视购物商城由阿里方面负责。
									</p>
									<p>admin 15 / 10 /11</p>
								</div>
							</div>
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
		<footer id="footer" class="text-muted">
			<div class="container">
				<p>企业系统| 合作事宜| 版权投诉</p>
				<p>苏ICP 备12345678. © 1993-2016 大学生推荐系统. Powered by PANZUHONG.</p>
			</div>
		</footer>
		
		<script type="text/javascript" src="/SSM/js/prototype-1.6.0.3.js"></script>
		<script src="/SSM/js/jquery.min.js"></script>
		<script src="/SSM/js/bootstrap.min.js"></script>
		<script src="/SSM/js/vue.js"></script>
		<script src="/SSM/js/SSM.js"></script>
		<script src="/SSM/js/vuejs.js"></script>
	</body>
</html>