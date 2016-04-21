package com.service;

import com.model.Msg;

/**
 * 消息相关的服务
 * @author Administrator
 *
 */
public interface MsgService {
	//插入消息到数据库
	boolean insertMsg(Msg msg);
}
