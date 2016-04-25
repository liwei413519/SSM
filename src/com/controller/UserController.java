package com.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.model.Job;
import com.model.User;
import com.model.vo.V_LgoinInf;
import com.model.vo.V_RegInf;
import com.service.JobService;
import com.service.UserService; 
import com.util.MD5Util;

/**
 * 对用户相关的请求做处理
 * 
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/user")
public class UserController {
	//通过spring的注解获得一些需要的对象如 request
	@Autowired
	private UserService userService=null;
	@Autowired
	private JobService jobService=null;
	@Autowired
	private HttpServletRequest request=null;
	@Autowired
	private MsgController msgController=null;
	@Autowired
	private	HttpSession session=null;
	/*----------回到主页-------------*/
	@RequestMapping("/home")
	public String gohome(){
		//获取session中的user
		User oldUser=(User) session.getAttribute("user");
		if(oldUser!=null){//如果user存在
			//更新session中的user
			User user=userService.getUser(oldUser.getUname());
			session.setAttribute("user", user);
			//将新消息数量存入request
			msgController.putMessageCount(request);
		}
		//刷新消息（就算没有登录也要刷新，业务逻辑而已）存到session
		List<Job> jobs=jobService.getAllJobs();
		session.setAttribute("jobs", jobs);
		//从数据库获取消息数量，放到request("msgcount")
		return "home";
	}

	/**
	 * 用户注册
	 * @return
	 */
	@RequestMapping(value="/regist",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String regist(){
		//构造前台对象
		V_RegInf regInf=new V_RegInf();
		JSONObject json=JSONObject.fromObject(request.getParameter("data"));
		regInf.setUsername(json.getString("username"));
		regInf.setPassword(json.getString("password"));
		regInf.setUsertype(json.getString("usertype"));
		//调用兄弟服务（看是否存在改用户：前台之前的调用并不是安全的，所以后应该再次检查）
		if(exist(json.getString("username")).equals("1")){//用户已经存在
			return "{'fail':'注册失败：用户存在，请重新注册！'}";
		}
		//调用服务层注册用户
		int result=userService.regist(regInf);
		if(result>0){
			return "success";
		}
		return "{'fail':'数据库的未知的错误！'}";
	}
	
	/**
	 * 用户登录
	 * @return
	 */
	@RequestMapping(value="/login",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String login(){
		//从前台获取登录用户对象
		V_LgoinInf loginInf=new V_LgoinInf();
		JSONObject json=JSONObject.fromObject(request.getParameter("data"));
		loginInf.setUsername(json.getString("username"));
		loginInf.setPassword(json.getString("password"));
		//调用服务层用户登录
		User user=userService.login(loginInf);
		if(user==null){
			return "{'fail':'登录失败:用户名或密码无效！'}";
		}
		if(user.getUloginstate()==-1){//用户被冻结
			return "{'fail':'登录失败:用户被管理员锁定,请联系管理员！'}";
		}
		//用户登录成功，将user放到session
		session.setAttribute("user", user);
		//保存用户登录时间到session
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		session.setAttribute("logintime", sf.format(new Date()));
		return "success";
	}
	/**
	 * 查询用户是否存在
	 * @return
	 */
	@RequestMapping(value="/existsuser",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String exist(String username){
		//获取需要查询的用户的名称
//		String username=request.getParameter("username");
		//调用服务层
		User user=userService.getUser(username);
		if(user==null){
			return "0";//表示用户不存在
		}else{
			return "1";//表示用户存在
		}
	}

	/**
	 * 退出登录
	 * @return
	 */
	@RequestMapping(value="/loginout",produces = "text/html;charset=UTF-8")
	public String loginout(){
		//清空session
		try{
			//将上次登录时间更新到数据库
			User user=(User) session.getAttribute("user");
			if(user==null){//可能session过期了或者用户未登录，返回首页
				return "home";
			}
			user.setUlastlogintime(String.valueOf(session.getAttribute("logintime")));
			userService.updateUser(user);
			//销毁该用户的session
			session.invalidate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "home";
	}
	
	/***
	 * 个人资料请求
	 * @return
	 */
	@RequestMapping(value="/personinf",produces = "text/html;charset=UTF-8")
	public String personinf(){
		//刷新页面之前从数据库获取user(进来这个页面之前session中以及存在user,可以从这里拿到id)
		User oldUser=(User) session.getAttribute("user");
		if(oldUser!=null){
			User user=userService.getUser(oldUser.getUname());
			session.setAttribute("user", user);
			//将新消息数量存入request
			msgController.putMessageCount(request);
		}
		//返回personinf.jsp这个页面
		return "personinf";
	}
	/**
	 * 密码修改请求
	 */
	@RequestMapping(value="/changepwd",produces = "text/html;charset=UTF-8")
	public String changepwd(){
		//将新消息数量存入request
		msgController.putMessageCount(request);
		return "changepwd";
	}
	/**
	 * 处理用户表单
	 * @param user
	 * @return
	 */
	/*字段表单*/
	@RequestMapping(value="uploadtext",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String updateInf(User user){
		//这里或许需要校验数据的合法性
		//TODO
		//调用服务层更新
		int result=userService.updateUserBySelected(user);
		if(result>0){//插入成功
			return "success";
		}
		return "{'fail':'数据插入失败,请联系管理员.'}";
	}
	/*图片表单*/
	@RequestMapping(value="uploadpicture",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String uploadpicture(@RequestParam("userpicture") MultipartFile[] files,User user){
		String type="img";
		String id=user.getUid()+"";
		//文件基本路径
		String basePath=session.getServletContext().getRealPath("/")+"upload/"+id+"/"+type+"/";
		//调用服务层处理文件上传（文件集合,基本路径）
		boolean success=userService.saveFiles(files, basePath);
		if(success){//上传成功
			//把图片保存后的路径更新到用户的表(这里要作相应的改变路径处理)
			//因为这里是保存用户头像，只需要选取第一个作为就可以了
			String filename=files[0].getOriginalFilename();
			String end=filename.substring(filename.lastIndexOf(".")+1);
			user.setUpicture("/SSM/upload/"+user.getUid()+"/"+type+"/"+MD5Util.MD5(filename)+"."+end);
			if(userService.updateUserBySelected(user)>0){
				return "success";
			}
		}
		return "{'fail':'图片上传失败'}";
	}
	/*文本表单*/
	@RequestMapping(value="uploaddoc",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String upload(@RequestParam("userpicture") MultipartFile[] files,User user){
		String type="doc";
		String id=user.getUid()+"";
		//文件基本路径
		String basePath=session.getServletContext().getRealPath("/")+"upload/"+id+"/"+type+"/";
		//调用服务层处理文件上传（文件集合,基本路径）
		boolean success=userService.saveFiles(files, basePath);
		if(success){//上传成功
			//把文件保存后的路径更新到用户的表(这里要作相应的改变路径处理)
			//因为这里是保存用户头像，只需要选取第一个作为就可以了
			//得到文件后缀
			String filename=files[0].getOriginalFilename();
			String end=filename.substring(filename.lastIndexOf(".")+1);
			user.setUresume("/SSM/upload/"+user.getUid()+"/"+type+"/"+MD5Util.MD5(filename)+"."+end);
			if(userService.updateUserBySelected(user)>0){
				//将用户信息从数据库再次更新到session
				return "success";
			}
		}
		return "{'fail':'文件上传失败'}";
	}
	/*校验旧密码*/
	@RequestMapping(value="oldpwdsame",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String oldPwdSame(String oldpwd){//json传值也可以注入，很nice啊
		User user=(User)session.getAttribute("user");
		//调用服务层获取用户密码（MD5状态）
		try{
			String dbpwdMD5=userService.getUser(user.getUname()).getUpassword();
			String oldpwdMD5=MD5Util.MD5(oldpwd);
			if(dbpwdMD5.equals(oldpwdMD5)){
				return "success";//返回success:密码一致
			}
		}catch(Exception e){
			e.printStackTrace();
			return "{'fail':'数据库错误！'}";//数据库错误
		}
		return "error";//返回error:密码不一致
	}
	/*密码修改*/
	@RequestMapping(value="tochangepwd",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String tochangepwd(String newpwd1){//注入前台新密码
		User user=(User)session.getAttribute("user");
		user.setUpassword(MD5Util.MD5(newpwd1));//新密码转换为MD5
		if(userService.updateUserBySelected(user)>0){//修改成功
			return "success";
		}
		return "{'fail':'密码修改失败！'}";
	}
	/*跳转到about.jsp页面*/
	@RequestMapping(value="about",produces = "text/html;charset=UTF-8")
	public String about(){
		//将新消息数量存入request
		msgController.putMessageCount(request);
		return "about";
	}
}
