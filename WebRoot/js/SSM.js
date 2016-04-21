var pwinf=false;		//控制密码的输入格式
var userinf=false;		//控制用户名的输入格式
var textupover=false;	//用来判断文本的上传，默认为false,接收到后台的success后赋值为true;
var imgupover=true;   //用来判断文件是否上传成功：默认true是因为进度条逻辑判断问题：只有当用户选择了要上传图片才赋值false,好让服务器返回success的时候判断为true;
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
	if(document.getElementById('welcome')==null){//如果没有这个标签，说明用户没有登录,
		alert("用户还未登录或session过期");
		return false;
	}
	if(window.confirm("提示:\n你真的要退出系统吗？")){
		//发送退出的ajax请求
		$.ajax({
			url:"/SSM/user/loginout.do",
			async:'false',
			type:'get',
			cache:'false',
			dataType:'html',//返回的是一个页面（包含在data里面）
			success:function(data,type){
				if(data.indexOf('<title>Home</title>')!=-1){//如果返回的是一个Home页面(这个算是一个比较取巧的思想吧。)
					//请求回到主页
					refreshtohome(500,"/SSM/user/home.do");                   
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
function refreshtohome(time,path){
	//一段时间后自动刷新页面到主页
	var id;
	id=window.setTimeout(fun,time);
	function fun() { 
		window.clearTimeout(id);
		location.href=path;
	}
};
function gotologin(){
	//一段时间后自动刷新页面到主页
	var id;
	id=window.setTimeout(fun,1000);
	function fun() { 
		window.clearTimeout(id);
		login($('#username').val().trim(),$('#password').val().trim());
	}
};
function login(name,pwd){
	if(pwinf==true && userinf==true){
		var username=$('#username').val().trim(); 
		var password=$('#password').val().trim();
		if(username==''){
			username=name;
			password=pwd;
		}
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
					refreshtohome(1000,"/SSM/user/home.do");
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
};
//模态框中的注册和登录按钮事件
$('#regbtn').on('click',function(){
	if(pwinf==true && userinf==true){
		var username=$('#username').val().trim(); 
		var password=$('#password').val().trim();
		var usertype=$("input:radio[name='usertype']:checked").val();
		var json={"username":username,"password":password,"usertype":usertype};
		var post={"data":JSON.stringify(json)};
		/*这里我使用ajax请求*/
		$.ajax({
			url:"/SSM/user/regist.do",
			data:post,
			async:'false',
			type:'post',
			cache:'false',
			success:function(data){
				if(data=="success"){
					//这里提示用户注册成功
					$("#regbtn").popover('show');
					//转到登录
					gotologin();
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
$('#loginbtn').on('click',login);

//用户名,前台密码和确认密码的限制条件
$('.pwd').on('blur',function(){
	var p1=$('#password').val();
	var p2=$('#repassword').val();
	if(p1=="" && p2==""){//没有任何密码输入，不处理
		return false;
	}
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
	if(username=="" || username==null){//没有任何输入,不处理
		return false;
	}
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
$(function(){
	var options={
		title:"<h3><span class='text-success text-center'>注册成功</span></h3>",
		content:"<h6><span class='text-primary'>欢迎使用大学生就业推荐系统！</span></br></br></br></br><span class='text-danger'>自动登录中。。。</span></h6>",
		trigger:'manual',
		html:true,
		placement:'left',
		delay: { show: 500, hide: 100}
	};
	$('#regbtn').popover(options);
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
//密码输入大小写的提示
$(function(){
	var options={
		content:"<span class='text-primary'>开启大写！</span>",
		trigger:'manual',
		html:true, 
		placement:'left',
		delay: { show: 0, hide: 0}
	};
	$('#inputinf').popover(options);
});
//用户下载文档的提示内容
$(function(){
	var options={
		content:"<span class='text-danger'>提示:</br>点击下载文件</span>",
		trigger:'manual',
		html:true, 
		placement:'right',
		delay: { show: 0, hide: 0}
	};
	$('#userdoc').popover(options);
});
//当鼠标进入docdiv(文档下载图片)发生时间
$('#userdoc').on('mouseover',function(){
	$('#userdoc').popover('show');
});
//当鼠标离开docdiv(文档下载图片)发生时间
$('#userdoc').on('mouseout',function(){
	$('#userdoc').popover('hide');
});
//文件头像-------------------------------------这里有问题先不管了（显示选择的本地图片）:蛋蛋的忧桑：只对IE有效。。麻蛋---->该功能暂不实现
$('#upfile').on('change',function(){
	//TODO:这里作为拓展
//	//由于各种方法都不行只能先上传了，通过调用某个隐藏的btn来控制
//	$("form[name='uploadpictureform']").submit();
//	var id=$('#imgid').val();
//	var filename=$('#selectfile').val();
//	//对filename处理
//	filename=filename.substring(filename.lastIndexOf('\\')+1);
//	var path="/SSM/upload/"+id+"/img/"+filename;
//	$('#userimg').attr('src',path);//
//	//一段时间后自动刷新页面到主页
//	var id;
//	id=window.setTimeout(function(){
//		window.clearTimeout(id);
//		$('#userimg').refresh(); 
//	},5000);
	$('#imgtip').attr('class','show glyphicon glyphicon-ok text-success');
});

//上传简历
$('#selectdoc').on('change',function(){
	//当用户选择文档之后将filetip显示
	$('#filetip').attr('class','show glyphicon glyphicon-ok text-success');
});
//用户信息更新部分，同时提交多个表单
$("#submitall").on('click',function(){
	$("form[name='uploadtextform']").submit();
	//这里应该判断是否有选择本地图片,如果有才上传,否则会出错的（错误原因还不清楚，估计是表单加了enctype的缘故，必须要有对应的本地文件）
	if($('#selectfile').val()!=""){
		//这里让系统以为图片上传成功了：免得进度条出现逻辑错误
		imgupover=false;
		$("form[name='uploadpictureform']").submit();
	}
	//显示进度条
	$('#progressbar').modal('show');
	//让进度条开始工作
	startProgerss();
});
//替代默认的submit事件改为ajaxSubmit提交：因为默认submit会自动跳转到新页面<上传字段>
function submitcontrol1() { 
	// jquery 表单提交
	$("#baseform").ajaxSubmit(function(message) { 
		// 对于表单提交成功后处理，message为提交页面的返回内容
		if(message=="success"){
		   textupover=true;
		}else{
			var obj=message.evalJSON();
			alert("信息提示:\n"+obj.fail);
		}
	}); 
	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
};
//替代默认的submit事件改为ajaxSubmit提交：因为默认submit会自动跳转到新页面 <上传图片>
function submitcontrol2() {
	// jquery 表单提交
	$("#picform").ajaxSubmit(function(message) { 
		// 对于表单提交成功后处理，message为提交页面的返回内容
		if(message=="success"){//简历上传成功
			imgupover=true;
		}else{
			var obj=message.evalJSON();
			alert("信息提示:\n"+obj.fail);
		}
	}); 
	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
};
//替代默认的submit事件改为ajaxSubmit提交：因为默认submit会自动跳转到新页面  <上传文件>
function submitcontrol3() {
	//这里要判断用户是否选择了文件,只有选择了文件才允许发送请求
	if($('#selectdoc').val()==""){//没有选择文件就返回
		alert("请先选择你要上传的文件！");
		return false;
	}
	// jquery 表单提交
	$("#docform").ajaxSubmit(function(message) { 
		// 对于表单提交成功后处理，message为提交页面的返回内容
		if(message=="success"){//文件上传成功
			//把选择的文件清空,隐藏filetip
			$('#selectdoc').val("");
			$('#filetip').attr('class','hidden');
			refreshtohome(0, "");
			alert("文件上传成功");
		}else{
			var obj=message.evalJSON();
			alert("信息提示:\n"+obj.fail);
		}
	}); 
	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
};
//进度条的控制
function startProgerss(){
	var trytmp=0;
	var wait=false;
	run();
	function run(){
		if(!wait){
			vue.length+=(Math.random()*10).ceil();
		}
        if(vue.length<=98){
        	//****这里  如果不上传文件   就不应该判断imgupover这个boolean类型的值：否则导致进度条逻辑错误
            if(vue.length>80 && textupover && imgupover){
            	vue.length=100;
            	 $("div[role='progressbar']").css("width","100%");
     	       	//短暂延迟后刷新页面,貌似""作用是刷新本页面
     			refreshtohome(1000, "");
            }else{
            	$("div[role='progressbar']").css("width",vue.length+"%");
            	var timer=setTimeout(run,100);
            }
        }else{//等待时间过长，可能出现了其他错误
        	wait=true;//进入等待状态
        	vue.length=99;
        	$("div[role='progressbar']").css("width","99%");
        	//查看服务器的响应
        	if(textupover && imgupover){
            	vue.length=100;
            	 $("div[role='progressbar']").css("width","100%");
     	       	//短暂延迟后刷新页面,貌似""作用是刷新本页面
     			refreshtohome(1000, "");
            }
        	if(++trytmp<10){//超时等待(大约10s)
        		var timer=setTimeout(run,1000);
        	}else{
            	alert("服务器响应失败！");
            	//隐藏进度条提示框
            	$('#progressbar').modal('hide');
            	//重置进度条的长度
            	vue.length=10;
        	}
        }
   }
};
//使用Vue.js来分离数据
var vue=new Vue({
	el:"#progresslength",
	data:{
		length:10
	}
});
//设置模态框：点击空白处不隐藏模态框  backdrop:static时,空白处不关闭.keyboard:false时,esc键盘不关闭. ---这是打开的方法
//如果设置通用方法，最好是在定义<div class="modal">的时候加上 data-backdrop="static"
//$('.modal').modal({backdrop: 'static', keyboard: false});