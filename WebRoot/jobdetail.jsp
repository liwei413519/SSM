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
		<link href="/SSM/css/writejob.css" rel="stylesheet"/>
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
		<div class="jumbotron" style="background-color:RGB(73,73,54);background-image:none">
			<div class="container">
				<hgroup>
					<h1>温馨提示:</h1>
					<h4>用人单位以任何名义向应聘者收取费用都属违法行为（如押金、资料费、代收体检费、代收淘宝信誉等），请提高警惕并注意保护个人信息！</h4>
				</hgroup>
			</div>
		</div>
        
        <!--
        	作者：332068039@qq.com
        	时间：2016-03-31
        	描述：发布消息的表单
        -->
       <div id="writejob">
	        <div class="container">
	        	<!-- 上半部分 -->
	        	<div class="row">
	        		<div class="col-sm-9 col-md-9 col-lg-9 info-left">
	        			<form class="form-horizontal">
	        				<input type="hidden" id="fromid" value="${user.uid}"/><!-- From_id -->
	        				<input type="hidden" id="toid" value="${job.uid}"/><!-- To_id -->
			        		<!-- 招聘基本要求 -->
			        		<div class="container-fluid" style="padding: 0px;">
								<div class="row info-content">
									<div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:15px">
										<label class="text-danger">基本要求</label>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback">
												<label class="col-lg-12 text-success control-label fontcontrol">职位名称:<span id="jobname">${job.tJname }</span></label>
										</div>
									</div>
						        	<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback ">
												<label class="col-lg-12 text-success control-label fontcontrol">专业:${job.tJmarjor }</label>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback ">
												<label class="col-lg-12 text-success control-label fontcontrol">工作地点:${job.tJplace}</label>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback ">
												<label class="col-lg-12 text-success control-label fontcontrol">月薪:${job.tJsalary }</label>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback">
												<label class="col-lg-12 text-success control-label fontcontrol">招聘人数:${job.tJcount }</label>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="form-group has-feedback">
												<label class="col-lg-12 text-success control-label fontcontrol">CET:${job.tJcet}</label>
										</div>
									</div>
								</div>
							</div>
							<!-- 招聘详细说明 -->
							<div class="container-fluid" style="padding: 0;">
								<div class="row info-content">
									<div class="col-sm-12 col-md-12 col-lg-12" style="margin-top:15px">
										<label class="text-danger">招聘详细</label> 
									</div>
									<div class="col-sm-12 col-md-10 col-md-push-1 col-lg-10 col-lg-push-1">
										<blockquote>
											${job.tJbody }
										</blockquote>
									</div>
								</div>
							</div>
							<!-- 发布消息按钮 -->
							<div class="container-fluid" style="padding: 0;margin-bottom: 10px">
								<div class="row">
									<c:choose>
										<%-- 非自己进入 --%>
										<c:when test="${user.uid!=job.uid }">
											<div class="col-sm-6 col-md-12 col-lg-12" align="center"  >
											<button id="postresumebtn" type="button" class="btn btn-lg btn-danger" style="background-color:#fff;color:#000;font-family:KaiTi">投递简历</button>
										</div>
										</c:when>
										<%-- 自己进入 --%>
										<c:otherwise>
											<div class="col-sm-6 col-md-12 col-lg-12" align="center"  >
												<button id="" type="button" class="btn btn-lg btn-danger" style="background-color:#fff;color:#000;font-family:KaiTi">查看收到的投递</button>
											</div>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
						</form>
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3 info-right">
						<!-- 用户相关部分 -->
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12" >
								<div class="thumbnail" id="imgdiv" style="background-color:#ccc;margin:10px 0 20px 0;">
									<img src="${owner.upicture }" alt="Logo"/>
										<div class="caption">
											<!-- 如果还没有填写公司名称就显示name -->
											<h3><a href="#">${empty owner.urealname?owner.uname:owner.urealname }</a></h3>
											<p>${owner.useldescribe }</p>
											<p>
												<a href="#">其他职位</a>
											</p>
											<p>
												<a href="#" class="btn btn-default" style="color:white;background-color:gray">了解更多</a>
											</p>
										</div>
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
		<script src="/SSM/js/changepwd.js"></script>
	</body>

</html>