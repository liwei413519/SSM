package com.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.MsgMapper;
import com.mapper.UserMapper;
import com.model.Msg;
import com.model.User;
import com.model.vo.V_MsgDisplay;
import com.service.MsgService;

@Service
@Transactional
public class MsgServiceImpl implements MsgService{
	@Resource
	private MsgMapper msgMapper=null;
	@Resource
	private UserMapper userMapper=null;
	public boolean insertMsg(Msg msg) {
		if(msgMapper.insertSelective(msg)>0){//插入成功
			return true;
		}
		return false;
	}

	public List<Msg> getAllMsg() {
		return msgMapper.getAll();
	}

	public Msg getMsgByPrimaryKey(String id) {
		int msgid=Integer.valueOf(id);
		//调用DAO层方法
		return msgMapper.selectByPrimaryKey(msgid);
	}

	public List<Msg> getMsgsByFromId(String fromid) {
		return msgMapper.getMsgsByFromId(Integer.valueOf(fromid));
	}

	public List<Msg> getMsgsByToId(String toid) {
		return msgMapper.getMsgsByToId(Integer.valueOf(toid));
	}

	public List<Msg> getMsgsByToAndFromId(String fromid,String toid) {
		return msgMapper.getMsgsByFromAndToId(Integer.valueOf(fromid), Integer.valueOf(toid));
	}

	public boolean postJobMsg(String fromid, String toid,String msgbody) {
		//1.创建一个Msg对象
		Msg msg=new Msg();
		//2.填充这个Msg对象
		msg.settMtype(Msg.JOBE_POST_TYPE);//设置消息类型是岗位投递
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		msg.settMdate(sf.format(new Date()));//设置系统消息日期
		msg.settMbody(msgbody);//设置消息内容
		msg.settMhead("您有一条求职信息，请查收！");//设置消息标题
		msg.settMread(Msg.MSG_NOREAD);//设置消息未读状态
		msg.settMfrom(Integer.valueOf(fromid));//设置消息的发送者
		msg.settMto(Integer.valueOf(toid));//设置消息的接受者
		//3.调用Dao层插入msg
		if(msgMapper.insertSelective(msg)>0){//插入成功
			return true;
		}
		return false;
	}

	public int getMsgCount(int toid) {
		//调用Dao层根据toid获取消息数量
		return msgMapper.getMsgCount(toid);
	}
	public int getNewMsgCount(int toid) {
		//调用Dao层根据toid获取消息数量
		return msgMapper.getNewMsgCount(toid);
	}

	public List<V_MsgDisplay> getVMsgsByToId(String toid) {
		List<Msg> list=msgMapper.getMsgsByToId(Integer.valueOf(toid));
		List<V_MsgDisplay> vlist=new ArrayList<V_MsgDisplay>();
		Map<Integer,User> map=new HashMap<Integer,User>();
		for(Msg msg:list){
			V_MsgDisplay v=new V_MsgDisplay(msg);
			//这里针对具体的业务处理数据
			//根据msg.fromid拿到下面的数据,为了提高效率这里控制一下避免重复访问
			User user=map.get(msg.gettMfrom());
			if(user==null){//如果map里面没有,就从数据库获取然后在放进去，下次就不会再到这里面来拿从而提高效率
				user=userMapper.selectByPrimaryKey(msg.gettMfrom());
				map.put(msg.gettMfrom(), user);
			}
			v.setFromname(user.getUname());
			v.setFromrealname(user.getUrealname());
			v.setDownloadresume(user.getUresume());
			vlist.add(v);
		}
		return vlist;
	}

	public int setMsgHasRead(int toid) {
		//更新到已读
		return msgMapper.updateToHasRead(toid);
	}




	
}
