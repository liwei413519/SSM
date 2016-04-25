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
        	描述：用户信息表单部分
        -->
        <div id="information" >
	        <div class="container" id="inf">
	        	<!-- 上半部分 -->
	        	<div class="row">
	        		<div class="col-sm-9 col-md-9 col-lg-9 info-left">
	        			<form id="baseform" method="post" action="/SSM/user/uploadtext.do" name="uploadtextform" onsubmit="return submitcontrol1();">
	        				<input type="hidden" name="uid" value="${user.uid}"/>
	        				<input type="hidden" name="uname" value="${user.uname }"/>
			        		<!-- 左边部分 -->
			        		<div class="container-fluid" style="padding: 0px;">
								<div class="row info-content" style="padding-top:10px">
						        	<div class="col-sm-6 col-md-6 col-lg-6">
										<div class="form-group has-feedback" id="userstate">
											<label class="text-success">账户状态: </label> 
											<c:choose>
												<c:when test="${user.uloginstate==0}">
													{{{normal}}}
												</c:when>
												<c:when test="${user.uloginstate==1}">
													{{{limited}}}
												</c:when>
												<c:when test="${user.uloginstate==-1}">
													{{{locked}}}
												</c:when>
											</c:choose>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
												<label for="name" class="text-success">{{${user.utype}.name}}</label>
												<input type="text" id="name" name="urealname" class="form-control inputcoloor" placeholder="请输入{{${user.utype}.name}}" value="${user.urealname}"/>
												<span class="glyphicon glyphicon-pencil form-control-feedback"></span>
										</div>
										<template v-if="${user.utype}.school">
											<div class="form-group has-feedback">
												<label for="school" class="text-success">毕业院校</label>
												<input type="text" id="school" name="uschool" class="form-control inputcoloor" placeholder="请输入毕业院校" value="${user.uschool}"></input>
												<span class="glyphicon glyphicon-stats form-control-feedback"></span>
											</div>
										</template>
										<div class="form-group has-feedback">
											<label for="email" class="text-success">{{${user.utype}.email}}</label>
											<input type="email" id="email" name="uemail" class="form-control inputcoloor" placeholder="请输入{{${user.utype}.email}}" value="${user.uemail}"></input>
											<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="birthday" class="text-success">{{${user.utype}.birthday}}</label>
											<input type="date" id="birthday" name="ubirthday" class="form-control inputcoloor" placeholder="请输入{{${user.utype}.birthday}}" value="${user.ubirthday }"></input>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										</div>
									</div>
									<div class="col-sm-6 col-md-6 col-lg-6">
										<template v-if="${user.utype}.sex">
											<div class="form-group has-feedback">
												<label for="sex" class="text-success">选择性别</label>
												<select id="sex" name="usex" class="form-control inputcoloor">
													<c:choose>
														<c:when test="${user.usex==0 }">
															<option value="0" selected>男</option>
															<option value="1">女</option>
														</c:when>
														<c:otherwise>
															<option value="0" >男</option>
															<option value="1" selected>女</option>
														</c:otherwise>
													</c:choose>
												</select>
												<span class="glyphicon glyphicon-user form-control-feedback"></span>
											</div>
										</template>
										<template v-if="${user.utype}.height">
											<div class="form-group">
												<label for="height" class="text-success">身高(cm)</label> 
												<span class="input-group">
													<input type="number" name="uheight" min="130" max="230" value="${user.uheight }"  class="form-control inputcoloor" id="height" placeholder="请输入您的身高"></input>
													<span class="input-group-addon">cm</span>
												</span>
											</div>
										</template>
										<div class="form-group has-feedback">
											<label for="tel" class="text-success">{{${user.utype}.tel}}</label>
											<input type="tel" id="tel" name="uphone" class="form-control inputcoloor" placeholder="请输入{{${user.utype}.tel}}" value="${user.uphone }"></input>
											<span class="glyphicon glyphicon-phone form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="idcard" class="text-success">{{${user.utype}.idcard}}</label>
											<input type="text" id="idcard" name="uidcard" class="form-control inputcoloor" placeholder="请输入{{${user.utype}.idcard}}" value="${user.uidcard}"></input>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="container-fluid" style="padding: 0;">
								<div class="row info-content" style="padding-top:10px">
									<div class="col-sm-12 col-md-12 col-lg-12">
										<div class="form-group has-feedback">
											<label for="selfdescribe" class="text-success">{{${user.utype}.sef}}</label> 
											<textarea class="form-control inputcoloor selfdescribe"  name="useldescribe" rows=15  placeholder="{{${user.utype}.sef}}" >${user.useldescribe }</textarea>
											<span class="glyphicon glyphicon-user form-control-feedback"></span>
										</div>
									</div>
								</div>
							</div>
							<div class="container-fluid" style="padding: 0;margin-bottom: 10px">
								<div class="row">
									<div class="col-sm-6 col-md-12 col-lg-12" align="center"  >
										<button type="button" id="submitall" class="btn btn-lg" style="background-color:#aaa;color:#000">提交</button>
									</div>
								</div>
							</div>
							<!--
					        	作者：332068039@qq.com
					        	时间：2016-04-11
					        	描述：进度条模态框
					        -->
							<div class="container-fluid" style="padding: 0;">
								<div class="row ">
									<div class="col-sm-6 col-md-12 col-lg-12" align="center"  >
										<div class="modal fade" data-backdrop="static" tabindex="-1" id="progressbar">
											<!--窗口声明：-->
											<div class="modal-dialog modal-lg">
												<!-- 内容声明 -->
												<div class="modal-content">
													<!-- 主体 -->
													<div class="modal-body">
														<div class="progress progress-striped active">
														   <div id="progresslength" class="progress-bar progress-bar-success" role="progressbar" style="width: 10%;">
														      	保存中:{{length}}%
														   </div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
					
					<!-- 右边部分 -->
					<div class="col-sm-3 col-md-3 col-lg-3 info-right">
						<!-- 用户头像 -->
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12" >
								<form id="picform" enctype="multipart/form-data" method="post" name="uploadpictureform" action="/SSM/user/uploadpicture.do" onsubmit="return submitcontrol2();">
									<input id=imgid type="hidden" name="uid" value="${user.uid}"/>
		        					<input type="hidden" name="uname" value="${user.uname }"/>
									<div class="form-group">
										<label  class="text-success">{{${user.utype}.picture}}</label>
										<div id="imgdiv" align="center">
											<div style="margin-bottom:10px">
												<img class="img-circle" id="userimg" width="200px" style="border" height="200px" src="${user.upicture }" align="bottom" alt="用户头像"/>
											</div>
											<a href="#" class="file" id="upfile">选择图片
											    <input type="file" name="userpicture" id="selectfile" accept="image/*">
											</a>
											<span id="imgtip" style="margin-bottom:10px" class="hidden form-control">已选择</span>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- 简历文档 -->
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12" >
								<form id="docform" enctype="multipart/form-data" method="post" name="uploaddocform" action="/SSM/user/uploaddoc.do" onsubmit="return submitcontrol3();">
									<input id="user_id" type="hidden" name="uid" value="${user.uid}"/>
		        					<input type="hidden" name="uname" value="${user.uname }"/>
									<div class="form-group">
										<label  class="text-success">{{${user.utype}.resume}}</label>
										<div style="margin-bottom:10px" id="a">
											<!-- 这里是下载链接 -->
											<a href="${user.uresume }">
												<img class="img-rounded" id="userdoc" width="60%" style="border" height="60%" src="/SSM/upload/default/doc.jpg" align="bottom" alt="点我下载文档"/>
											</a>
											<a href="#" class="file" id="updocfile">选择文档
										 	  <input type="file" name="userpicture" id="selectdoc" accept="application/msword">
											</a>
											<span id="filetip" class="hidden form-control">你已经选择了一个要上传的文档！</span>
										</div>
										
										<input type="submit" class="form-control inputcoloor" value="开始上传"/> 
									</div>
								</form>
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