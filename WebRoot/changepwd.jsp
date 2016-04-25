<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Change</title>
		<link href="/SSM/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="/SSM/css/ssm.css" rel="stylesheet"/>
		<link href="/SSM/css/changepwd.css" rel="stylesheet"/>
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
        
        <!--
        	作者：332068039@qq.com
        	时间：2016-03-31
        	描述：修改密码的表单
        -->
        <div class="container" id="pwddiv">
        	<div class="row">
        		<div class="col-lg-6 col-lg-push-3 col-md-6 col-md-push-3 col-sm-12 col-xs-12">
				    <form id="pwdform" class="form" method="post" action="/SSM/user/tochangepwd.do" onsubmit="return ajaxsubmit();">
						<div class="container-fluid">
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="row" style="marging-botton:30px">
									<div class="col-lg-12 col-md-12  form-group">
										<div class="pwdmargin">
											<label for="oldpwdinput" class="glyphicon glyphicon-apple control-label">  旧密码:</label>
										</div>
										<input name="oldpwd" id="oldpwdinput" maxlength="16" type="password" class="form-control" placeholder="请输入旧密码"/>
										<span id="oldpwdspan" class="hidden" style="color: #C9302C;"></span>
									</div>
								</div>
								<div class="row " style="marging-botton:30px">
									<div class="col-lg-12 col-md-12  form-group">
										<div class="pwdmargin">
											<label for="password" class="glyphicon glyphicon-book control-label">  新密码:</label>
										</div>
										<input name="newpwd1" id="password" maxlength="16" type="password" class="form-control pwd" placeholder="请输入新密码"/>
										<span id="pwd1" class="hidden" style="color: #C9302C;"></span>
									</div>
								</div>
								<div class="row " style="marging-botton:30px"> 
									<div class="col-lg-12 col-md-12 form-group">
										<a href="#" id="inputinf" data-toggle="popover"></a>
										<div class="pwdmargin">
											<label for="repassword" class="glyphicon glyphicon-book control-label">  确认新密码:</label>
										</div>
										<input name="newpwd2" id="repassword" maxlength="16" type="password" class="form-control pwd" placeholder="请再次输入新密码"/>
										<span id="pwd2" class="hidden" style="color: #C9302C;"></span>
									</div>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="row " style="marging-botton:30px">
									<div class="col-lg-12 col-md-12  form-group" align="right">
										<input type="reset" class="btn" style="background-color:#ccc;color:#000" value="清空输入"/>
										<input type="submit" class="btn btn-primary" value="确认修改"/>
									</div>
								</div>
							</div>
						</div>
				    </form>
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
		<script src="/SSM/js/changepwd.js"></script>
	</body>

</html>