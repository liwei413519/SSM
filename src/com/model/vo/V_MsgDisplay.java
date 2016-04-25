package com.model.vo;

import com.model.Msg;

/**
 * 在页面中展示：因为数据库的数据不能直接展示在后台,需要在后台先做响应的处理
 * @author Administrator
 *
 */
public class V_MsgDisplay extends Msg{
	private String fromname;//消息发送者的名称(登录名)
	private String fromrealname;//消息发送者的真名
	public String getDownloadresume() {
		return downloadresume;
	}
	public void setDownloadresume(String downloadresume) {
		this.downloadresume = downloadresume;
	}
	private String downloadresume;//下载简历
	public V_MsgDisplay(Msg msg){//这里强制吧父转为子
		this.settMbody(msg.gettMbody());
		this.settMdate(msg.gettMdate());
		this.settMfrom(msg.gettMfrom());
		this.settMhead(msg.gettMhead());
		this.settMid(msg.gettMid());
		this.settMpicture(msg.gettMpicture());
		this.settMread(msg.gettMread());
		this.settMremark(msg.gettMremark());
		this.settMstate(msg.gettMstate());
		this.settMto(msg.gettMto());
		this.settMtype(msg.gettMtype());
	}
	public String getFromname() {
		return fromname;
	}
	public void setFromname(String fromname) {
		this.fromname = fromname;
	}
	public String getFromrealname() {
		return fromrealname;
	}
	public void setFromrealname(String fromrealname) {
		this.fromrealname = fromrealname;
	}
	
}
