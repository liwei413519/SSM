package com.controller;

import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.model.User;
import com.model.vo.V_LgoinInf;
import com.model.vo.V_RegInf;
import com.service.UserService;

/**
 * 对用户相关的请求做处理
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService=null;
	
	@RequestMapping("/home")//回到主页
	public String gohome(){
		return "home";
	}
	@RequestMapping(value="/regist",produces = "text/html;charset=UTF-8")//用户注册
	@ResponseBody
	public String regist(HttpServletRequest request,Model model){
		//构造前台对象
		V_RegInf regInf=new V_RegInf();
		JSONObject json=JSONObject.fromObject(request.getParameter("data"));
		regInf.setUsername(json.getString("username"));
		regInf.setPassword(json.getString("password"));
		//调用兄弟服务（看是否存在改用户：前台之前的调用并不是安全的，所以后应该再次检查）
		if(exist(json.getString("username"), model).equals("1")){//用户已经存在
			return "{'fail':'注册失败：用户存在，请重新注册！'}";
		}
		//调用服务层注册用户
		int result=userService.regist(regInf);
		if(result>0){
			return "success";
		}
		return "{'fail':'数据库的未知的错误！'}";
	}
	@RequestMapping(value="/login",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(HttpServletRequest request,Model model){
		//从前台获取登录用户对象
		V_LgoinInf loginInf=new V_LgoinInf();
		JSONObject json=JSONObject.fromObject(request.getParameter("data"));
		loginInf.setUsername(json.getString("username"));
		loginInf.setPassword(json.getString("password"));
		//调用服务层用户登录
		User user=userService.login(loginInf);
		if(user==null){
			return "{'fail':'登录失败：用户名或密码无效！'}";
		}
		//用户登录成功，将user放到session
		request.getSession().setAttribute("user", user);
		return "success";
	}
	@RequestMapping(value="/existsuser",produces = "text/html;charset=UTF-8")//从数据库查看该用户是否存在
	@ResponseBody
	public String exist(HttpServletRequest request,Model model){
		//获取需要查询的用户的名称
		String username=request.getParameter("username");
		//调用服务层
		User user=userService.getUser(username);
		if(user==null){
			return "0";//表示用户不存在
		}else{
			return "1";//表示用户存在
		}
	}
	//重载上面的方法
	public String exist(String username,Model model){
		//调用服务层
		User user=userService.getUser(username);
		if(user==null){
			return "0";//表示用户不存在
		}else{
			return "1";//表示用户存在
		}
	}
	
}
