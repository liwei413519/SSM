var pwdissame=false;
/**
* 旧密码输入框校验:ajax异步请求数据库校验旧密码是否与数据库密码一致
 */
$('#oldpwdinput').on('blur',function(){
	$('#oldpwdspan').attr('class','hidden');//先将提示恢复到隐藏
	var oldpwd=$('#oldpwdinput').val();
	if(oldpwd=="" || oldpwd==null){//没有输入,不校验
		return false;
	}
	//发送异步请求到后台查看旧密码是否一致
	$.ajax({
		type:"post",
		url:"/SSM/user/oldpwdsame.do",
		async:false,
		data:{
			"oldpwd":oldpwd
		},
		success:function(data){
			if(data=="success"){//密码一致
				pwdissame=true;
				$('#oldpwdspan').attr('class','show glyphicon glyphicon-ok').html('');
			}else if(data=="error"){//密码不一致
				pwdissame=false;
				$('#oldpwdspan').attr('class','show').html('*与原密码不匹配');
			}else{
				pwdissame=false;
				var obj=data.evalJSON();
				alert("信息提示:\n"+obj.fail);
			}
		},
		error:function(data){
			pwdissame=false;
			alert("请求发送错误：请检查网络设置！");
		}
	});
});


/**
 * 替代默认的submit事件改为ajaxSubmit提交：因为默认submit会自动跳转到新页面<上传字段>
 * */
function ajaxsubmit() { 
	// jquery 表单提交
	$("#pwdform").ajaxSubmit(function(message) { 
		if(!pwdissame){  //原密码输入错误，直接返回不处理
			return false;
		}
		// 对于表单提交成功后处理，message为提交页面的返回内容
		if(message=="success"){ //修改成功
			//刷新该页面
			refreshtohome(20, "/SSM/user/loginout.do");
			//提示用户密码修改成功
		    alert("密码修改成功：请重新登录");
		}else{
			var obj=message.evalJSON();
			alert("信息提示:\n"+obj.fail);
		}
	}); 
	return false; // 必须返回false，否则表单会自己再做一次提交操作，并且页面跳转
};
/*延迟后跳转到指定页面*/
function refreshtohome(time,path){
	//一段时间后自动刷新页面到主页
	var id;
	id=window.setTimeout(fun,time);
	function fun() { 
		window.clearTimeout(id);
		location.href=path;
	}
};