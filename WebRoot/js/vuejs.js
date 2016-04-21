//自动选择用户类型
new Vue({
	el:'#welcome',
	data: {
		m:'管理员',
		e:'企业',
		r:'普通用户'
	}
});
//实现用户菜单
new Vue({
	el:"#usermenu",
	data:{
		menus:{
			m:[
			 	{item:"<a href='/SSM/user/personinf.do'>管理员资料</a>"},
			 	{item:"<a href='/SSM/user/personinf.do'>消息中心</a>"},
			 	{item:"<a href='/SSM/msg/tomessage.do'>发布管理消息</a>"},
			 	{item:"<li class='divider'></li>"},
			 	{item:"<a href='/SSM/user/changepwd.do'>修改密码</a>"}
		    ],
			e:[
			 	{item:"<a href='/SSM/user/personinf.do'>企业资料</a>"},
			 	{item:"<a href='/SSM/user/personinf.do'>消息中心</a>"},
			 	{item:"<a href='/SSM/msg/tomessage.do'>发布招聘</a>"},
			 	{item:"<li class='divider'></li>"},
			 	{item:"<a href='/SSM/user/changepwd.do'>修改密码</a>"}
		    ],
			r:[
			 	{item:"<a href='/SSM/user/personinf.do'>个人资料</a>"},
			 	{item:"<a href='/SSM/user/personinf.do'>消息中心</a>"},
			 	{item:"<li class='divider'></li>"},
			 	{item:"<a href='/SSM/user/changepwd.do'>修改密码</a>"}
			 	
		    ]
		}
	}
});

//账户状态：这里考虑到拓展，就放到vuejs里面了
new Vue({
	el:"#userstate",
	data:{
		normal:"<input type='text' style='color:#222' class='form-control ' disabled='disabled' value='正常'></input>",
		limited:"<input type='text' style='color:#aaa' class='form-control ' disabled='disabled' value='限制'></input>",
		locked:"<input type='text' style='color:#f00' class='form-control ' disabled='disabled' value='冻结'></input>"
	}
});

//个人名称/企业名称/管理员名称
new Vue({
	el:"#inf",
	data:{
//		downdoc:"/SSM/upload/"+$('#user_id').val()+"/doc/resume.doc",
		m:{name:"管理员名称",email:"管理员个人邮箱",sex:true,height:true,tel:"管理员电话",sef:"管理员简介",idcard:"管理员身份证件号码",birthday:"管理员生日",picture:"管理员头像",resume:"管理制度"},
		e:{name:"企业名称",email:"公司邮箱",tel:"联系我们",sef:"公司简介",idcard:"公司注册编号",birthday:"公司注册日期",picture:"公司logo",resume:"公司协议"},
		r:{name:"用户名称",email:"个人邮箱",school:true,sex:true,height:true,tel:"个人电话",sef:"个人简介",idcard:"身份证件号码",birthday:"生日",picture:"个人头像",resume:"个人简历"}
	}
});
