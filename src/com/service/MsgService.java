package com.service;

import java.util.List;

import com.model.Msg;
import com.model.vo.V_MsgDisplay;

/**
 * 消息相关的服务
 * @author Administrator
 *
 */
public interface MsgService {
	//插入消息到数据库
	boolean insertMsg(Msg msg);
	//获得所有的信息，返回list集合
	List<Msg> getAllMsg();
	//根据id得到消息对象
	Msg getMsgByPrimaryKey(String msgid);
	//根据fromid拿到所有消息对象
	List<Msg> getMsgsByFromId(String fromid);
	//根据toid拿到所有消息对象
	List<Msg> getMsgsByToId(String toid);
	//根据toid拿到所有前台展示的消息对象
	List<V_MsgDisplay> getVMsgsByToId(String toid);
	//根据from和to的id拿到消息对象
	List<Msg> getMsgsByToAndFromId(String fromid,String toid);
	//投递岗位
	boolean postJobMsg(String fromid,String toid,String msgbody);
	//获取消息数量
	int getMsgCount(int toid);
	//获取新消息数量
	int getNewMsgCount(int toid);
	//更新消息状态，将未读设置为已读
	int setMsgHasRead(int toid);
}
