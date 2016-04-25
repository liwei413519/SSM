package com.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mapper.MsgMapper;

@Service
@Transactional
public class test {
	@Resource
	MsgMapper msgMapper=null;
	@Test
	public void test1(){
		int count=msgMapper.getMsgCount(2);
		System.out.println("cont="+count);
	}
}
