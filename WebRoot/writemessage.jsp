<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Write</title>
		<link href="/SSM/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="/SSM/css/ssm.css" rel="stylesheet"/>
		<link href="/SSM/css/changepwd.css" rel="stylesheet"/>
		<link href="/SSM/css/writemessage.css" rel="stylesheet"/>
	</head>

	<body class="table-responsive">
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
        
        <!--
        	作者：332068039@qq.com
        	时间：2016-03-31
        	描述：发布消息的表单
        -->
       <div id="writemsg">
	        <div class="container">
	        	<!-- 上半部分 -->
	        	<div class="row">
	        		<div class="col-sm-9 col-md-9 col-md-push-1 col-lg-9 col-lg-push-1 info-left">
	        			<form id="" method="post" action="" name="" onsubmit="" class="form-horizontal">
	        				<input type="hidden" name="uid" value="${user.uid}"/>
	        				<input type="hidden" name="uname" value="${user.uname }"/>
			        		<!-- 招聘基本要求 -->
			        		<div class="container-fluid" style="padding: 0px;">
								<div class="row info-content">
									<div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:15px">
										<label class="text-danger">基本要求</label>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">职位名称</label>
												<div class="col-lg-8">
													<input type="text" id="" name="" class="form-control inputcoloor" placeholder="Edit"/>
													<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
												</div>
												
										</div>
									</div>
						        	<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">专业</label>
												<div class="col-lg-8">
													<input type="text" id="" name="" class="form-control inputcoloor" placeholder="Edit"/>
													<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
												</div>
												
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">工作地点</label>
												<div class="col-lg-8">
													<input type="text" id="" name="" class="form-control inputcoloor" placeholder="Edit"/>
													<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
												</div>
												
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">月薪</label>
												<div class="col-lg-8">
													<select id="salary" name="salary" class="form-control inputcoloor">
																<option value="2k-3k" selected>2k-3k</option>
																<option value="3k-5k">3k-5k</option>
																<option value="5k-8k">5k-8k</option>
																<option value="10k以上">10k以上</option>
													</select>
													<span class="glyphicon glyphicon-list form-control-feedback"></span>
												</div>
												
												
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">招聘人数</label>
												<div class="col-lg-8">
													<select id="empnumber" name="empnumber" class="form-control inputcoloor">
																<option value="1-5" selected>1-5</option>
																<option value="5-10">5-10</option>
																<option value="10-20">10-20</option>
																<option value="无限制">无限制</option>
													</select>
													<span class="glyphicon glyphicon-list form-control-feedback"></span>
												</div>
												
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-4">
										<div class="form-group has-feedback">
												<label for="" class="col-lg-4 text-success control-label">CET</label>
												<div class="col-lg-8">
													<select id="sex" name="usex" class="form-control inputcoloor">
																<option value="CET-4" selected>CET-4</option>
																<option value="CET-6">CET-6</option>
																<option value="无限制">无限制</option>
													</select>
													<span class="glyphicon glyphicon-list form-control-feedback"></span>
												</div>
												
										</div>
									</div>
								</div>
							</div>
							<!-- 招聘详细说明 -->
							<div class="container-fluid" style="padding: 0;">
								<div class="row info-content">
									<div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:15px">
										<label class="text-danger">岗位说明</label> 
									</div>
									<div class="col-sm-12 col-md-10 col-md-push-1 col-lg-10 col-lg-push-1" align="center">
										<div class="form-group has-feedback">
											<textarea class="form-control inputcoloor selfdescribe"  name="" rows=25 id="" placeholder="岗位说明" ></textarea>
											<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
										</div>
									</div>
								</div>
							</div>
							<!-- 发布消息按钮 -->
							<div class="container-fluid" style="padding: 0;margin-bottom: 10px">
								<div class="row">
									<div class="col-sm-6 col-md-12 col-lg-12" align="center"  >
										<button type="button" id="" class="btn btn-lg" style="background-color:#aaa;color:#000">发布</button>
									</div>
								</div>
							</div>
						</form>
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
		<script src="/SSM/js/jquery-form.js"></script>
		<script src="/SSM/js/changepwd.js"></script>
	</body>

</html>