<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
									<a href="#" id="welcome" data-toggle="dropdown" ><span class="dropdown-toggle glyphicon glyphicon-apple"></span> {{${user.utype}}}-${empty user.urealname?user.uname:user.urealname }<span class="caret"></span></a>
									<!-- 根据用户类型选择 Vue实现-->
									<ul class="dropdown-menu">
										<li v-for="menu in menus.${user.utype}">
											{{{menu.item}}}
										</li>
									</ul>
								</li>
								<li>
									<a href='/SSM/msg/tomessagecenter.do'>消息 <span class='badge'>${msgcount}</span></a>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="#" id="tologin">我的信息</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="#" id="tologinout"><span class="glyphicon glyphicon-log-out"></span> 退出</a></li>
						<li><a href="/SSM/user/about.do"><span class="glyphicon glyphicon-question-sign"></span> 关于</a></li>
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