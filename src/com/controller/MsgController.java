package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.User;
import com.model.vo.V_MsgDisplay;
import com.service.MsgService;

@Controller
@RequestMapping("/msg")
public class MsgController {
	//通过Spring注入一些对象如request，session
	@Autowired
	private HttpServletRequest request=null;
	@Autowired
	private HttpSession session=null;
	@Autowired
	private MsgService msgService=null;
	/**
	 * 请求进入消息中心
	 */
	@RequestMapping("/tomessagecenter")
	public String tomessagecenter(){
		User user=(User) session.getAttribute("user");
		//将数据库未读的设置为已读(update)
		msgService.setMsgHasRead(user.getUid());
//		//将新消息数量注入request
		putMessageCount(request);
		//返回messagecenter.jsp
		return "messagecenter";
	}
	//把toid这个用户的未读消息放到指定request里面
	public void putMessageCount(HttpServletRequest request){
		//获取user
		
		User user=(User)session.getAttribute("user");
		if(user!=null){
			//从数据库获取消息数量，放到request("msgcount")
			int count=msgService.getNewMsgCount(user.getUid());
			request.setAttribute("msgcount", count);
		}
	}
	/*test*/
	@RequestMapping(value="/AjaxPage",produces = "text/html;charset=UTF-8")
	public @ResponseBody String AjaxPage(String toid){
        //自己写里面的，返回的是Json数据
		//调用服务层获取前台展示的对象集合（这里不是直接获取数据库中的原始Model而是做了转换）
		List<V_MsgDisplay> displayMsg=msgService.getVMsgsByToId(toid);
		//转换成json数组到前台去
		JSONArray str=JSONArray.fromObject(displayMsg);
		System.out.println("后台返回的json数组:"+str.toString());
		return str.toString();
    }
}
