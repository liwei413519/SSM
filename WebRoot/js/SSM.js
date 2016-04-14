var pwinf=false;
var userinf=false;
/*-------------------------------图片轮播部分Js-------------------------------------------*/
$("#myCarousel").carousel({
		//自动播放两秒
		interval: 4000,
});
	//调整轮播器箭头的位置
$('.carousel-control').css('line-height', $('.carousel-inner img').height() + 'px');
$(window).resize(function() {
	var $height = $('.carousel-inner img').eq(0).height() ||
		$('.carousel-inner img').eq(1).height() ||
		$('.carousel-inner img').eq(2).height();
	$('.carousel-control').css('line-height', $height + 'px');
});

/*------------------------------我的信息部分（登录注册）-------------------------------------------*/
//退出系统
$('#tologinout').on('click',function(){
	if(window.confirm("提示:\n你真的要退出系统吗？")){
		//发送退出的ajax请求
		$.ajax({
			url:"/SSM/user/loginout.do",
			async:'false',
			type:'get',
			cache:'false',
			success:function(data){
				if(data=="success"){
					//请求回到主页
					location.href="/SSM/user/home.do";
				}else{
					var obj=data.evalJSON();
					alert("信息提示:\n"+obj.fail);
				}
			},
			error:function(data){
				alert("请求发送错误：请检查网络设置！");
			}
		});
	}
});

//点击我的信息弹出登录注册的提示框
$('#tologin').on('click',function(){
	$('#loginmodal').modal('toggle');
});
//模态框中的注册和登录按钮事件
$('#regbtn').on('click',function(){
	if(pwinf==true && userinf==true){
		var username=$('#username').val().trim(); 
		var password=$('#password').val().trim();
		var usertype=$("input:radio[name='usertype']:checked").val();
		var json={"username":username,"password":password,"usertype":usertype};
		var post={data:JSON.stringify(json)};
		/*这里我使用ajax请求*/
		$.ajax({
			url:"/SSM/user/regist.do",
			data:post,
			async:'false',
			type:'post',
			cache:'false',
			success:function(data){
				if(data=="success"){
					alert("成功注册");
				}else{
					var obj=data.evalJSON();
					alert("信息提示:\n"+obj.fail);
				}
			},
			error:function(data){
				alert("请求发送错误：请检查网络设置！");
			}
		});
	}
});
$('#loginbtn').on('click',function(){
	if(pwinf==true && userinf==true){
		var username=$('#username').val().trim(); 
		var password=$('#password').val().trim();
		var json={"username":username,"password":password};
		var post={data:JSON.stringify(json)};
		/*这里我使用ajax请求*/
		$.ajax({
			url:"/SSM/user/login.do",
			data:post,
			async:'false',
			type:'post',
			cache:'false',
			success:function(data){
				if(data=="success"){
					//这里提示用户登录成功
					$("#loginbtn").popover('show');
					//一段时间后自动刷新页面
					var id;
					id=window.setTimeout(fun,1300);
					function fun() { 
						window.clearTimeout(id);
						location.href="/SSM/user/home.do";
					}
				}else{
					var obj=data.evalJSON();
					alert("信息提示:\n"+obj.fail);
				}
			},
			error:function(data){
				alert("请求发送错误：请检查网络设置！");
			}
		});
	}
});
//用户名,前台密码和确认密码的限制条件
$('.pwd').on('blur',function(){
	var p1=$('#password').val();
	var p2=$('#repassword').val();
	if(p1.length<6){
		$('#pwd1').html('*密码长度不能低于6位').attr('class','show');
		pwinf=false;
	}else{
		$('#pwd1').html('').attr('class','show glyphicon glyphicon-ok');
		pwinf=true;
	}
	if(p2.length<6){
		$('#pwd2').html('*密码长度不能低于6位').attr('class','show');
		pwinf=false;
	}else if(p1!=p2){
		$('#pwd2').html('*两次输入的密码不一致，请重新输入').attr('class','show');
		pwinf=false;
	}else{
		$('#pwd2').html('').attr('class','show glyphicon glyphicon-ok');
		pwinf=true;
	}
});
$('#username').on('blur',function(){
	var username=$('#username').val();
	if(hasChn(username) || username.length<6){//包含除了字母数字之外
		$('#userinf').html('*用户输入只能是6-18位字母或数字').attr('class','show').css('color','#C9302C');
		userinf=false;
	}else{
		$('#userinf').html('').attr('class','show glyphicon glyphicon-ok').css('color','#3E8F3E');
		userinf=true;
		//发送异步请求到后台查看该用户是否存在
		$.ajax({
			type:"post",
			url:"/SSM/user/existsuser.do",
			async:true,
			data:{
				"username":username
			},
			success:function(data){
				if(data=='0'){//用户不存在，只能注册
					$('#userinf').html('可以注册该用户');
					//设置登录按钮不可用
					$('#regbtn').removeAttr('disabled');
					$('#loginbtn').attr('disabled','disabled');
					//设置用户类型可选
					$("[name=usertype]").removeAttr('disabled');
				}else{//用户存在,只能登录
					$('#userinf').html('可以登录该用户');
					//设置注册按钮不可用
					$('#regbtn').attr('disabled','disabled');
					$('#loginbtn').removeAttr('disabled');
					//设置用户类型不可选同事去除选中状态
					$("[name='usertype']").attr('disabled','disabled');
				}
			},
			error:function(data){
				alert("请求发送错误：请检查网络设置！");
			}
		});
	} 
});
//是否包含非数字字母（用来限制非中文输入）
function hasChn(str){
      var reg = /^[0-9a-zA-Z]*$/g;
      if(!reg.test(str)){
       return true;
      }
      return false;//只包含数字和字母
}
/*-----------------------------------------页面效果加强-------------------------------------------*/
//tooltip和popup的设置 
$(function(){
	var options={
	  	delay: { show: 1000, hide: 1000 },
	};
    $(".atip").tooltip(options);
});
$(function(){
	var options={
		title:"<h3><span class='text-success text-center'>登录成功</span></h3>",
		content:"<h6><span class='text-primary'>欢迎使用大学生就业推荐系统！</span></br></br></br></br><span class='text-danger'>系统跳转中。。。</span></h6>",
		trigger:'manual',
		html:true,
		placement:'left',
		delay: { show: 500, hide: 100}
	};
	$('#loginbtn').popover(options);
});
//密码输入框大小写提示
$(function(){
  function isIE(){ 
    if(!!window.ActiveXObject || "ActiveXObject" in window){ 
      return true; 
    }   
    else{ 
     return false; 
    } 
  } 
  (function(){ 
    if(!isIE()){
    	var flag=false;
    	$('#password,#repassword').on('keypress',function(event){
   			var e = event||window.event; 
   		 	var keyCode = e.keyCode||e.which;
   		 	var isShift = e.shiftKey ||(keyCode == 16 ) || false ;
		  	if(((keyCode>=65&&keyCode<=90 )&&!isShift)||((keyCode>=97&&keyCode<=122 )&&isShift)){
		  		if(!flag){
		  			$('#inputinf').popover('show');
		  		}
		  		flag=true;
   		 	} else{
   		 	$('#inputinf').popover('hide');
    			flag=false;
			} 
    	});
    	$('#password,#repassword').on('mouseout',function(){
    		//一段时间后隐藏该通知
			var id;
			id=window.setTimeout(fun,1000);
			function fun() { 
				window.clearTimeout(id);
				$('#inputinf').popover('hide');
			}
    	});
   }
  })();
});
$(function(){
	var options={
		content:"<span class='text-primary'>开启大写！</span>",
		trigger:'manual',
		html:true, 
		placement:'left',
		delay: { show: 0, hide: 0}
	};
	$('#inputinf').popover(options);
//	$('').popover(options);
});
