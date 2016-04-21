package com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mapper.MsgMapper;
import com.model.Msg;
import com.service.MsgService;

@Service
@Transactional
public class MsgServiceImpl implements MsgService{
	@Resource
	private MsgMapper msgMapper=null;

	public boolean insertMsg(Msg msg) {
		if(msgMapper.insertSelective(msg)>0){//插入成功
			return true;
		}
		return false;
	}
	
}
