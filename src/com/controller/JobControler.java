package com.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.model.Job;
import com.model.User;
import com.service.JobService;
import com.service.MsgService;
import com.service.UserService;

@Controller
@RequestMapping("/job")
public class JobControler {
	//通过spring的注解获得一些需要的对象如 request
	@Autowired
	private JobService jobService=null;
	@Autowired
	private UserService userService=null;
	@Autowired
	private MsgService msgService=null;
	@Autowired
	private HttpServletRequest request=null;
	@Autowired
	private MsgController msgController=null;
	/**
	 * 发布消息
	 */
	//请求发布消息的页面
	@RequestMapping("/toaddjob")
	public String tomessage(){
		//将新消息数量存入request
		msgController.putMessageCount(request);
		return "addjob";
	}
	//提交消息保存到数据库
	@RequestMapping("/submitjob")
	@ResponseBody
	public String submitMessage(Job job){//注入前台的job表单
		if(jobService.insertJob(job)){//消息插入成功
			return "success";
		}
		return "{'fail':'插入失败，请重试'}";
	}
	
	/**
	 * 查看消息详情
	 */
	//请求发布消息的页面
	@RequestMapping("/jobdetail")
	public String jobdetail(String jobid){//自动注入用户点击的消息的id
		//1。跳转到该页面之前要先获取job对象，保存到request(试试看能不能使用--结果争取可以request，说明该框架return是转发。。实际上好像也是，看地址栏就知道。。。。无语了)
		Job job=jobService.getJobByPrimaryKey(jobid);
		request.setAttribute("job", job);
		//2.获取到该企业的其他岗位的信息
		List<Job> jobsofuser=jobService.getjobsByUserId(job.getUid()+"");
		
		//TODO:这里由于业务逻辑管理，可能不需要全部取出来，看情况，到时候再改这里就行了
		request.setAttribute("jobsofuser", jobsofuser);
		//3.获取user对象（用来展示）
		User owner=userService.getUser(job.getUid());
		request.setAttribute("owner", owner);
		//将新消息数量存入request
		msgController.putMessageCount(request);
		//4.转到消息详情页面
		return "jobdetail";
	}
	/**
	 * 投递简历
	 */
	//投递简历
	@RequestMapping("/postresume")
	@ResponseBody
	public String postresume(String fromid,String toid,String msgbody){
		//投递简历,就是给企业发送一个Msg,告诉企业有人关注了该职位
		boolean flag=msgService.postJobMsg(fromid, toid,msgbody);
		if(flag){//消息发送成功
			return "success";
		}
		return "{'fail':'消息发送失败！请重试'}";
	}
}
