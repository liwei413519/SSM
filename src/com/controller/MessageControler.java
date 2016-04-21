package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Msg;
import com.service.MsgService;

@Controller
@RequestMapping("/msg")
public class MessageControler {
	//通过spring的注解获得一些需要的对象如 request
	@Autowired
	private MsgService msgService=null;
	@Autowired
	private HttpServletRequest request=null;
	@Autowired
	private	HttpSession session=null;
	
	/**
	 * 发布消息
	 */
	//请求发布消息的页面
	@RequestMapping("/tomessage")
	public String tomessage(){
		return "writemessage";
	}
	//提交消息保存到数据库
	@RequestMapping("/submitmessage")
	@ResponseBody
	public String submitMessage(Msg msg){//注入前台的msg表单
		if(msgService.insertMsg(msg)){//消息插入成功
			return "success";
		}
		return "{'fail':'插入失败，请重试'}";
	}
	
	
}
